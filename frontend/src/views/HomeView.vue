<script setup>
import NavbarLogin from '@/components/NavbarLogin.vue'
</script>

<template>
  <NavbarLogin/>
  <div class="flex justify-center">
    <div class="custom-bg">
      <div class="flex justify-center text-2xl mt-20 mx-20 font-bold">
        ห้องปฏิบัติการเบเกอรี่
      </div>
      <div class="flex justify-center text-2xl my-5 mx-20 font-bold">
        Bakery Room
      </div>
      <div class="flex justify-center my-10">
        คณะอุตสาหกรรมเกษตร มหาวิทยาลัยเกษตรศาสตร์
      </div>
      <div class="flex justify-center">
        <figure>
          <img class="mt-5" src="@/assets/bakery-room.png" />
        </figure>
      </div>
      <div class="flex">
        <div class="font-bold mt-12 ml-44">
          สถานที่ตั้ง
        </div>
        <div class="mt-12 ml-5">
          อาคารเรียนและปฏิบัติการวิจัย ตึก5 ชั้น 1 5101-02
        </div>
      </div>
      <div class="font-bold mt-8 ml-44">
        อาจารย์ผู้ควบคุมการใช้ห้องปฏิบัติการ
      </div>
      <div class="mt-3 ml-44">
        <ul class="list-disc ml-5">
          <li>ผศ. ดร.มาศอุบล ทองงาม</li>
        </ul>
      </div>
      <div class="font-bold mt-8 ml-44">
        เจ้าหน้าที่ดูแลการใช้ห้องปฏิบัติการ
      </div>
      <div class="mt-3 ml-44">
        <ul class="list-disc ml-5">
          <li>น.ส.พรพิมล พลสุวรรณ(ผู้ดูแลหลัก)</li>
        </ul>
      </div>
      <div class="mt-3 ml-44">
        <div class="ml-5">
          Email : pornpimol.p@ku.th Phone : 085-181-7485
        </div>
      </div>
      <div class="mt-3 ml-44">
        <ul class="list-disc ml-5">
          <li>นายสมพร บุญอินทร์(ผู้ดูแลร่วม)</li>
        </ul>
      </div>
      <div class="mt-3 ml-44">
        <div class="ml-5">
          Email : fagispbi@ku.ac.th Phone : 081-424-5692
        </div>
      </div>
      <div class="mt-3 ml-44">
        <ul class="list-disc ml-5">
          <li>นายธนวน วาขำ(ผู้ดูแลร่วม)</li>
        </ul>
      </div>
      <div class="mt-3 ml-44">
        <div class="ml-5">
          Email : fagitnw@ku.ac.th Phone : 089-991-0331
        </div>
      </div>
      <div class="flex flex-row-reverse">
        <RouterLink to="/login" class="btn custom-booking-btn my-12 ml-4 mr-40 w-32">
          Booking
        </RouterLink>
        <RouterLink to="/time-table" class="btn custom-calendar-btn my-12 w-32">
          ตารางการจอง
        </RouterLink>
      </div>
    </div>
  </div>
</template>

<style scoped>
.custom-calendar-btn {
  background-color: #EA6AB75D;
}

.custom-booking-btn {
  background-color: #15570F;
  color: #fff
}

.custom-bg {
    background-color: none;
    width: 1000px;
    height: 100%;
    overflow: auto;
}
</style>
