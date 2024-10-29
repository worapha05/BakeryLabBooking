const express = require('express')
const bodyParser = require('body-parser')
const mysql = require('mysql2/promise')
const cors = require('cors')
const app = express()
const bcrypt = require('bcrypt')

app.use(bodyParser.json())
app.use(cors())
const port = 8000

let conn = null

const initMySQL = async () => {
    conn = await mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: 'root',
        database: 'bakerylabbooking'
    })
}

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

app.post("/api/login", async (req, res) => {
    try {
        const { KU_email, password } = req.body;
  
        let [result] = await conn.query("SELECT * from person WHERE KU_email = ?", KU_email);
        const user = result[0];
        const match = await bcrypt.compare(password, user.password);
        if (!match) {
        return res.status(400).send({ message: "Invalid email or password" });
        }
        let userData = {
            KU_email: user.KU_email,
            first_name: user.first_name,
            last_name: user.last_name,
            profile_image: user.profile_image,
            status: user.status,
            role: user.role
        }

        if (user.role == "student") {
            [result] = await conn.query("SELECT * from student WHERE KU_email = ?", KU_email)
            userData.student_id = result[0].student_id
            userData.department = result[0].department
            userData.blacklist_status = result[0].blacklist_status
            userData.phone_number = result[0].phone_number
        } else if (user.role == "professor") {
            [result] = await conn.query("SELECT * from professor WHERE KU_email = ?", KU_email)
            userData.professor_id = result[0].professor_id
            userData.department = result[0].department
            userData.position = result[0].position
            userData.phone_number = result[0].phone_number
        }
        res.send({ message: "Login successful",
            user: userData
        })
    } catch (error) {
        console.log('error', error)
    }
});

app.post('/api/room-available', async (req, res) => {
    const room = req.body;

    // ตรวจสอบว่าข้อมูลมีค่าหรือไม่

    const roomData = {
        date: room.date,
        time: room.time,
        room_status: "available"
    };

    try {
        const results = await conn.query("INSERT INTO room_availability SET ?", roomData);
        res.send({ message: "add success"});
    } catch (error) {
        console.error('Error inserting room availability:', error);
        res.status(500).send({ message: "Internal server error" });
    }
});

app.get('/api/room-available/:date', async (req, res) => {
    const date = req.params.date;

    try {
        const results = await conn.query("SELECT * FROM room_availability WHERE date = ?", date);
        res.send({ message: results[0]}); // ส่ง ID ของห้องที่ถูกจอง
    } catch (error) {
        console.error('Error inserting room availability:', error);
        res.status(500).send({ message: "Internal server error" });
    }
});

app.listen(port, async (req, res) => {
    await initMySQL()
    console.log('http server run at ' + port)
})