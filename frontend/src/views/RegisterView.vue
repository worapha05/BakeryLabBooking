<script setup>
import NavbarLogin from '@/components/NavbarLogin.vue'
</script>

<template>
    <NavbarLogin class="absolute top-0 w-full" />
    <div class="flex items-center justify-center mt-10">
        <div class="custom-bg">
            <div class="mt-20 mx-20 font-bold">
                Register account
            </div>
            <div class="flex justify-center mx-20 my-8 custom-text">
                ต้องเป็นข้อมูลของนิสิตคณะอุตสาหกรรมเกษตร มหาวิทยาลัยเกษตรศาสตร์เท่านั้น
            </div>
            <div class="avatar flex justify-center">
                <div class="w-36 rounded-full border">
                    <img src="@/assets/Piglet.webp" alt="">
                </div>
            </div>
            <div>
                <div class="uploade-button flex justify-center">
                    <label class="btn border-black m-5 cursor-pointer"> <!-- ใช้ label เพื่อให้คลิกได้ -->
                        <img src="@/assets/icon-upload.png" alt="">
                        Upload
                        <input type="file" class="hidden" /> <!-- ซ่อน input จริง -->
                    </label>
                    <button class="btn border-black m-5">
                        <img src="@/assets/icon-bin.png" alt="">
                        Delete
                    </button>
                </div>
            </div>
            <div class="mt-20 mx-52 my-5 font-bold">
                ข้อมูลส่วนตัว
            </div>
            <div>
                <div class="flex justify-center">
                    <input type="text" placeholder="Name" class="input input-bordered w-full max-w-xs my-5" />
                    <input type="text" placeholder="Surname" class="input input-bordered w-full max-w-xs ml-20 my-5" />
                </div>
                <div class="flex justify-center">
                    <input type="text" placeholder="Student ID" class="input input-bordered w-full max-w-xs my-5" />
                    <label class="input input-bordered flex items-center w-80 ml-20 my-5 relative"> <!-- เพิ่ม relative เพื่อให้ลูกศรอยู่ในตำแหน่งที่ถูกต้อง -->
                        <select class="custom-select grow">
                            <option value="" disabled selected>เลือกสาขาที่เรียน</option>
                            <option value="เทคโนโลยีอุตสาหกรรมเกษตร">เทคโนโลยีอุตสาหกรรมเกษตร</option>
                            <option value="เทคโนโลยีชีวภาพ">เทคโนโลยีชีวภาพ</option>
                            <option value="วิทยาศาสตร์และเทคโนโลยีการอาหาร">วิทยาศาสตร์และเทคโนโลยีการอาหาร</option>
                            <option value="เทคโนโลยีการบรรจุและวัสดุ">เทคโนโลยีการบรรจุและวัสดุ</option>
                            <option value="พัฒนาผลิตภัณฑ์">พัฒนาผลิตภัณฑ์</option>
                            <option value="วิทยาการสิ่งทอ">วิทยาการสิ่งทอ</option>
                        </select>
                        <span class="absolute right-3 top-1/2 transform -translate-y-1/2 pointer-events-none">▼</span> <!-- เพิ่มลูกศร -->
                    </label>
                </div>
            </div>
            <div class="mt-10 mx-52 font-bold">
                ข้อมูลติดต่อ
            </div>
            <div class="flex justify-center">
                <div>
                    <div class="my-5">
                        Email
                    </div>
                    <input type="text" placeholder="Email" class="input input-bordered w-80" />
                </div>
                <div>
                    <div class="my-5 ml-20">
                        Phone
                    </div>
                    <input type="text" placeholder="Phone" class="input input-bordered w-80 ml-20" />
                </div>
            </div>
            <div class="mt-10 mx-52 font-bold">
                ตั้งรหัสผ่าน
            </div>
            <div class="flex justify-center">
                <div>
                    <div class="my-5">
                        Password
                    </div>
                    <input type="text" placeholder="รหัสผ่าน" class="input input-bordered w-80" />
                </div>
                <div>
                    <div class="my-5 ml-20">
                        Confirm password
                    </div>
                    <input type="text" placeholder="ยืนยันรหัสผ่าน" class="input input-bordered w-80 ml-20" />
                </div>
            </div>
            <div class="create-account-btn my-10 flex justify-center">
                <RouterLink to="/login" class="btn custom-create-account-btn mt-2">
                    สร้างบัญชี
                </RouterLink>
            </div>
        </div>
    </div>
</template>

<style scoped>
.custom-bg {
    background-color: #F1F5F9;
    width: 1150px;
    height: 100%;
    overflow: auto;
}

.custom-text {
  background-color: none;
  color: #EA6AB7;
}

.custom-select {
    border: none; /* กำหนดกรอบ */
    background-color: none; /* พื้นหลัง */
    appearance: none; /* ซ่อนลูกศรปกติ */
    position: relative; /* กำหนดตำแหน่งให้กับลูกศร */
}

.custom-create-account-btn {
  background-color: #15570F;
  color: #fff;
}
</style>