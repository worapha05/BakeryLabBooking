const express = require('express')
const bodyParser = require('body-parser')
const mysql = require('mysql2/promise')
const cors = require('cors')
const app = express()
const bcrypt = require('bcrypt')
const multer = require('multer')

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, '../frontend/src/assets')
    },
    filename: function (req, file, cb) {
        const fileName = `${Date.now()}-${file.originalname}`
        cb(null, fileName)
    }
    })
  
    const upload = multer({
    storage: storage
    })

app.use(bodyParser.json())
app.use(cors())
const port = 8000

let conn = null

const initMySQL = async () => {
    conn = await mysql.createConnection({
        // port: 8889,
        host: 'localhost',
        user: 'root',
        password: 'root',
        database: 'bakerylabbooking'
    })
}

// upload file

app.post('/api/upload', upload.single('KU'), (req, res) => {
    try {
        console.log(req.file.filename); // ตรวจสอบว่า req.file มีข้อมูลไหม
        // ส่งชื่อไฟล์กลับไปที่ไคลเอนต์
        res.json({ filename: req.file.filename });
    } catch (error) {
        console.log("error", error);
        res.status(500).send('Error uploading file');
    }
});

const validateData = (personData) => {
    let errors = []
    
    if (!personData.KU_email) {
        errors.push('กรุณาใส่อีเมล์')
    }

    if (!personData.first_name) {
        errors.push('กรุณาใส่ชื่อจริง')
    }

    if (!personData.last_name) {
        errors.push('กรุณาใส่นามสกุล')
    }

    if (!personData.password) {
        errors.push('กรุณาใส่รหัสผ่าน')
    }

    if (!personData.department) {
        errors.push('กรุณาใส่ภาควิชา')
    }

    if (!personData.phone_number) {
        errors.push('กรุณาใส่เบอร์โทรศัพท์')
    }


    if (personData.role == "professor") {
        if (!personData.position)
        errors.push('กรุณาใส่ตำแหน่ง')
    }

    if (personData.role == "student") {
        if (!personData.student_id)
        errors.push('กรุณาใส่รหัสนิสิต')
    }

    return errors
}

// api register

app.post('/api/register', async (req, res) => {
    try {
        let person = req.body

        const errors = validateData(person)
        if (errors.length > 0) {
            throw {
                message: 'กรอกข้อมูลไม่ครบ',
                errors: errors
            }
        }

        const passwordHash = await bcrypt.hash(person.password, 10)

        personData = {
            KU_email: person.KU_email,
            first_name: person.first_name,
            last_name: person.last_name,
            password: passwordHash,
            role: person.role,
            status: "enabled",
            profile_image: person.profile_image
        }
        let results = await conn.query('INSERT INTO person SET ?', personData)



        if (person.role == 'student') {

            student = {
                student_id: person.student_id,
                KU_email: person.KU_email,
                department: person.department,
                blacklist_status: "nonblacklisted",
                phone_number: person.phone_number
            }

            results = await conn.query('INSERT INTO student SET ?', student)
        } else if (person.role == 'professor'){
            professor = {
                KU_email: person.KU_email,
                department: person.department,
                position: person.position,
                phone_number: person.phone_number
            }

            results = await conn.query('INSERT INTO professor SET ?', professor)
            
        }
        res.json({
            message: 'insert ok',
            data: results[0]
        })

    } catch (error) {
        const errorMessage = error.message || 'something wrong'
        const errors = error.errors || []
        console.error('error message', error.message)
        res.status(500).json({
            message: errorMessage,
            errors: errors
        })
    }
})


// api login

app.post("/api/login", async (req, res) => {
    try {
        const { KU_email, password } = req.body;

        let [result] = await conn.query("SELECT * from person WHERE KU_email = ?", [KU_email]);
        const user = result[0];

        if (!user) {
            return res.status(404).send({ message: "ไม่พบผู้ใช้" });
        }

        const match = await bcrypt.compare(password, user.password);
        if (!match) {
            return res.status(400).send({ message: "อีเมล์และรหัสผ่านไม่ถูกต้อง" });
        }

        if (user.status === "disabled") {
            return res.status(401).send({ message: "ไม่สามารถ Login" });
        }

        let userData = {
            KU_email: user.KU_email,
            first_name: user.first_name,
            last_name: user.last_name,
            profile_image: user.profile_image,
            status: user.status,
            role: user.role
        };

        if (user.role === "student") {
            [result] = await conn.query("SELECT * from student WHERE KU_email = ?", [KU_email]);
            if (result[0]) {
                userData.student_id = result[0].student_id;
                userData.department = result[0].department;
                userData.blacklist_status = result[0].blacklist_status;
                userData.phone_number = result[0].phone_number;
            }
        } else if (user.role === "professor") {
            [result] = await conn.query("SELECT * from professor WHERE KU_email = ?", [KU_email]);
            if (result[0]) {
                userData.professor_id = result[0].professor_id;
                userData.department = result[0].department;
                userData.position = result[0].position;
                userData.phone_number = result[0].phone_number;
            }
        }

        res.send({ message: "Login successful", user: userData });
    } catch (error) {
        console.error('Error during login:', error);
        res.status(500).send({ message: "เกิดข้อผิดพลาดในการเข้าสู่ระบบ" });
    }
});




// api save profile

app.patch('/api/profile-save-change/:KU_email', async (req, res) => {
    try {
        const KU_email = req.params.KU_email;
        const person = req.body;

        // ตรวจสอบผู้ใช้ที่มี email นี้
        let [results] = await conn.query("SELECT * from person WHERE KU_email = ?", [KU_email]);

        // ตรวจสอบว่าผู้ใช้มีอยู่จริง
        if (results.length === 0) {
            return res.status(404).json({ message: "ไม่พบผู้ใช้" });
        }

        let personData = {
            first_name: person.first_name,
            last_name: person.last_name,
            status: person.status,
            profile_image: person.profile_image
        };

        // Handle password update if old password is provided
        if (person.old_password !== person.new_password) {
            const currentPassword = results[0].password; // รหัสผ่านเดิมจากฐานข้อมูล

            // ตรวจสอบว่ารหัสผ่านเดิมมีอยู่จริง
            if (currentPassword) {
                const match = await bcrypt.compare(person.old_password, currentPassword);

                // ถ้ารหัสผ่านตรงกัน ให้แฮชรหัสผ่านใหม่
                if (match && person.new_password) {
                    const passwordHash = await bcrypt.hash(person.new_password, 10);
                    personData.password = passwordHash; // เพิ่มรหัสผ่านใหม่ที่แฮชเข้าไป
                } else if (!match) {
                    return res.status(401).json({ message: "รหัสผ่านเก่าไม่ถูกต้อง" });
                }
            }
        } else {
            if (person.new_password !== '' && person.new_password !== '') {
                return res.status(401).json({ message: "รหัสผ่านเก่ากับรหัสผ่านใหม่ซ้ำกัน" });
            }
        }

        // อัปเดตข้อมูลพื้นฐาน

        await conn.query('UPDATE person SET ? WHERE KU_email = ?', [personData, KU_email]);

        if (person.role === 'student') {
            const studentData = {
                blacklist_status: person.blacklist_status,
                phone_number: person.phone_number
            };
            await conn.query('UPDATE student SET ? WHERE KU_email = ?', [studentData, KU_email]);
        } else if (person.role === 'professor') {
            const professorData = {
                phone_number: person.phone_number
            };
            await conn.query('UPDATE professor SET ? WHERE KU_email = ?', [professorData, KU_email]);
        }

        res.json({
            message: 'Update successful',
            data: personData
        });

    } catch (error) {
        console.error('Error:', error.message);
        res.status(500).json({
            message: "มีบางอย่างผิดพลาด",
        });
    }
});

app.patch('/api/edit-status', async (req, res) => {
    try {
        const person = {
            status: req.body.status
        }
        const KU_email = req.body.KU_email

        // ตรวจสอบผู้ใช้ที่มี email นี้
        await conn.query("UPDATE person SET ? WHERE KU_email = ?", [person, KU_email]);
        const results = await conn.query("SELECT * from person WHERE KU_email = ?", [KU_email]);
        res.json({
            message: 'Edit status successful',
            user: results[0]
        });


    } catch (error) {
        console.error('Error:', error.message);
        res.status(500).json({
            message: "มีบางอย่างผิดพลาด",
        });
    }
});




app.get('/api/get-all-user', async (req, res) => {
    try {
        const result = await conn.query("SELECT * FROM person");
        res.send({ message: "get all user",
            user: result[0]
        });
    } catch (error) {
        console.error('Error inserting room availability:', error);
        res.status(500).send({ message: "Internal server error" });
    }
});






// api room available

app.post('/api/room-available', async (req, res) => {
    const room = req.body;

    // ตรวจสอบว่าข้อมูลมีค่าหรือไม่

    const roomData = {
        date: room.date,
        time: room.time,
        booking_id: room.booking_id
    };

    try {
        const results = await conn.query("INSERT INTO room_availability SET ?", roomData);
        res.send({ message: "add success"});
    } catch (error) {
        console.error('Error inserting room availability:', error);
        res.status(500).send({ message: "Internal server error" });
    }
});






// api เช็ก booking ในแต่ละวัน

app.get('/api/room-available/:date', async (req, res) => {
    const date = req.params.date;

    try {
        const results = await conn.query("SELECT * FROM room_availability WHERE date = ?", date);
        res.send({ room: results[0]}); // ส่ง ID ของห้องที่ถูกจอง
    } catch (error) {
        console.error('Error inserting room availability:', error);
        res.status(500).send({ message: "Internal server error" });
    }
});

app.listen(port, async (req, res) => {
    await initMySQL()
    console.log('http server run at ' + port)
})