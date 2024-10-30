<script setup>
import StudentLayout from '@/Layouts/StudentLayout.vue'

const equipments = ["เตาอบ", "เครื่องนวดแป้ง", "เครื่องตีไข่", 
                    "พิมพ์ขนมปัง", "พิมพ์เค้ก", "ที่ตัดแป้ง", 
                    "แปรงทาเนย/ไข่", "เครื่องชั่ง", "ถาดอบ",
                    "ชามผสม"]
</script>

<template>
    <StudentLayout>
        <div class="m-3 border-2 rounded-xl p-4">
            <div class="font-bold">จองห้องปฎิบัติการเบเกอรี่</div>
            <div class="my-3 text-sky-600">กรุณากรอกข้อมูลต่อไปนี้ให้ครบถ้วน</div>
            <div class="flex">
                <div class="font-bold">เลือกวันที่ต้องการเข้าใช้</div>
                <div class="ml-28 font-bold">เลือกเวลา</div>
            </div>
            <div class="flex">
                <div>
                    <input type="date" class="my-3 p-1.5 rounded-sm border-2">
                </div>
                <div class="ml-28">
                    <select class="my-3 p-1.5 rounded-sm border-2">
                        <option disabled selected>เลือกเวลาเริ่มต้น</option>
                        <option>09.00</option>
                        <option>10.00</option>
                        <option>11.00</option>
                        <option>12.00</option>
                        <option>13.00</option>
                        <option>14.00</option>
                        <option>15.00</option>
                        <option>16.00</option>
                    </select>
                </div>
                <div class="my-3 ml-10 p-1.5">
                    ถึง
                </div>
                <div class="ml-10">
                    <select class="my-3 p-1.5 rounded-sm border-2">
                        <option disabled selected>เลือกเวลาสิ้นสุด</option>
                        <option>10.00</option>
                        <option>11.00</option>
                        <option>12.00</option>
                        <option>13.00</option>
                        <option>14.00</option>
                        <option>15.00</option>
                        <option>16.00</option>
                        <option>17.00</option>
                    </select>
                </div>
            </div>
            <div class="mt-3 font-bold">
                ประเภทในการใช้ห้อง
            </div>
            <div class="flex my-2">
                <div class="w-40"><input type="radio" name="useCategory" value="ใช้เพื่อการแข่งขัน">ใช้เพื่อการแข่งขัน</div>
                <div class="w-40"><input type="radio" name="useCategory" value="ใช้เพื่อการทดลอง">ใช้เพื่อการทดลอง</div>
            </div>
            <div class="mt-3 font-bold">
                เหตุผลการใช้ห้อง
            </div>
            <textarea placeholder="วัตถุประสงค์และความสำคัญที่ต้องใช้" class="my-4 pt-4 pl-4 w-96 h-44 border-2"></textarea>
            <div class="font-bold">สมาชิกที่จะเข้าใช้ห้อง</div>
            <div class="flex">
                <input class="p-2 mr-4 my-2 border-2" type="text" placeholder="ชื่อจริง">
                <input class="p-2 mx-4 my-2 border-2" type="text" placeholder="นามสกุล">
                <input class="p-2 mx-4 my-2 border-2" type="text" placeholder="รหัสนิสิต">
                <input class="p-2 mx-4 my-2 border-2" type="text" placeholder="Email">
                <button class="btn bg-sky-300 mt-1">
                    <img src="@/assets/plus.png" alt="" class="w-3.5 fill-white">เพิ่ม
                </button>
            </div>
            <ul class="ml-5" style="list-style-type: disc;">
                <li>ดารารัตน์ จิตไพศาล 6510405776 worapha.c@ku.th</li>
                <li>ดารารัตน์ จิตไพศาล 6510405776 worapha.c@ku.th</li>
                <li>ดารารัตน์ จิตไพศาล 6510405776 worapha.c@ku.th</li>
            </ul>
            <div class="my-3 font-bold">
                ข้อมูลเอกสารที่ใช้แนบ
            </div>
            <div class="my-3">
                ใช้กรอกเพื่อยื่นให้อาจารย์และเจ้าหน้าที่เซ็นอนุมัต เมื่อกรอกเรียบร้อยแล้วให้แนบไฟล์มาด้วย
            </div>
            <div>
                <input type="file" class="file-input file-input-bordered w-full max-w-xs my-2" />
            </div>
            <div class="font-bold my-3">
                อุปกรณ์ที่ต้องใช้ (สามารถเลือกได้มากกว่าหนึ่งอย่าง)
            </div>
            <div>
                <ul class="grid grid-cols-6">
                    <li v-for="equipment in equipments"><input type="checkbox" class="my-3">{{ equipment }}</li>
                </ul>
            </div>
            <div class="create-account-btn my-10 flex justify-center">
                <RouterLink to="/student/booking/result" class="btn custom-create-account-btn mt-2">
                    ยืนยันการจอง
                </RouterLink>
            </div>
        </div>
    </StudentLayout>
</template>

<style scoped>
.custom-create-account-btn {
  background-color: #15570F;
  color: #fff;
}
</style>