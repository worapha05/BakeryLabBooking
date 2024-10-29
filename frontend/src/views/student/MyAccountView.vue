<script setup>
import StudentLayout from '@/Layouts/StudentLayout.vue'
import BookingCard from '@/components/BookingCard.vue'
import { computed, ref } from 'vue'
import { useUserStore } from '@/stores/user';

const statuses = ['Profile', 'Competition', 'Chang password']

const userStore = useUserStore()

const selectedStatus = ref("Profile")
const filterBooingList = computed(() => {
    return bookingDetail.filter(booking => booking.status === selectedStatus.value)
})

const changeSelectedStatus = ((newStatus) => {
    selectedStatus.value = newStatus
})

const editedFirstName = ref(userStore.selectedUser.first_name) 

</script>

<template>
    <StudentLayout>
        <div class="my-6">
            <span class="text-3xl mx-12">My account</span>
            <div class="my-6">
                <a v-for="status in statuses" :key="status"
                    :class="status === selectedStatus ? 'btn custom-button ml-12' : 'btn button ml-12'"
                    @click="changeSelectedStatus(status)">
                    {{ status }}
                 </a>
            </div>
            <div class="h-[0.5px] w-full bg-gray-300"></div>
        </div>

        <!-- Profile -->
        <div v-if="selectedStatus == 'Profile'">
            <div class="flex justify-center">
                <div class="main-container w-[1000px] bg-white shadow-lg mx-10 relative my-0 p-4 rounded-lg border-2 border-gray-300">
                    <div class="font-bold ml-10 mt-5">
                        Personal Information
                        <div class="h-[0.5px] w-80 rounded-lg border-2 bg-gray-300 my-3"></div>
                    </div>
                    <div class="avatar flex justify-center my-5">
                        <div class="w-36 rounded-full border">
                            <img src="@/assets/Piglet.webp" alt="">
                        </div>
                    </div>
                    <div>
                        <div class="uploade-button flex justify-center">
                            <label class="btn border-gray-300 m-5 cursor-pointer"> <!-- ใช้ label เพื่อให้คลิกได้ -->
                                <img src="@/assets/icon-upload.png" alt="">
                                Upload
                                <input type="file" class="hidden" /> <!-- ซ่อน input จริง -->
                            </label>
                            <button class="btn border-gray-300 m-5">
                                <img src="@/assets/icon-bin.png" alt="">
                                Delete
                            </button>
                        </div>
                    </div>
                    <div class="flex justify-center">
                        <div>
                            <div class="my-5">
                                ชื่อจริง
                            </div>
                            <input type="text" class="input input-bordered w-80" v-model="editedFirstName"/>
                        </div>
                        <div class="mx-9">
                            <div class="my-5">
                                นามสกุล
                            </div>
                            <input type="text" class="input input-bordered w-80" v-model="userStore.selectedUser.last_name"/>
                        </div>
                    </div>
                    <div class="flex justify-center">
                        <div>
                            <div class="my-5">
                                รหัสนิสิต
                            </div>
                            <div class="bg-white rounded-lg border border-gray-300 w-80 h-12 my-1 pt-3 pl-4">
                                {{ userStore.selectedUser.student_id }}                               
                            </div>
                        </div>
                        <div class="mx-9">
                            <div class="my-5">
                                สาขาวิชา
                            </div>
                            <div class="bg-white rounded-lg border border-gray-300 w-80 h-12 my-1 pt-3 pl-4">
                                {{ userStore.selectedUser.department }}                               
                            </div>
                        </div>
                    </div>
                    <div class="font-bold ml-10 mt-14">
                        Contact Infromation
                        <div class="h-[0.5px] w-80 rounded-lg border-2 bg-gray-300 my-3"></div>
                    </div>
                    <div class="flex justify-center mt-5">
                        <div>
                            <div class="my-5">
                                Email
                            </div>
                            <div class="bg-white rounded-lg border border-gray-300 w-80 h-12 my-1 pt-3 pl-4">
                                {{ userStore.selectedUser.KU_email }}                               
                            </div>
                        </div>
                        <div class="mx-9">
                            <div class="my-5">
                                Phone
                            </div>
                            <input type="text" placeholder="Phone" class="input input-bordered w-80" v-model="userStore.selectedUser.phone_number"/>
                        </div>
                    </div>
                    <div class="font-bold ml-10 mt-14">
                        About user
                        <div class="h-[0.5px] w-80 rounded-lg border-2 bg-gray-300 my-3"></div>
                    </div>
                    <div class="ml-32 my-9">
                        นิสิตคณะอุตสาหกรรมเกษตร
                    </div>
                </div>
            </div>
            <div class="flex justify-center">
                <button class="btn custom-change-btn w-36 mt-9 mb-14">
                    save change
                </button>
            </div>
        </div>

        <!-- Competition -->
        <div v-if="selectedStatus == 'Competition'">
            <div class="text-3xl mx-12">
                <div class="main-container w-[1000px] bg-white shadow-lg mx-10 relative my-0 p-4 rounded-lg border-2 border-gray-300">
                    <div class="flex">
                        <div class="font-bold text-base ml-10 mt-5">
                            Personal Information
                            <div class="h-[0.5px] w-80 rounded-lg border-2 bg-gray-300 my-3"></div>
                        </div>
                        <button class="btn absolute right-0 mt-2 mr-52">
                            <img src="@/assets/icon-add-blue.png" alt="">
                            แก้ไข
                        </button>
                        <button class="btn custom-add-comp-button absolute right-0 mt-2 mr-10">
                            <img src="@/assets/icon-add-blue.png" alt="">
                            เพิ่มการแข่งขัน
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </StudentLayout>
</template>

<style scoped>
.custom-button {
    background-color: #2784E1;
    color: white;
}

.custom-select {
    border: none; /* กำหนดกรอบ */
    background-color: none; /* พื้นหลัง */
    appearance: none; /* ซ่อนลูกศรปกติ */
    position: relative; /* กำหนดตำแหน่งให้กับลูกศร */
}

.custom-change-btn {
  background-color: #15570F;
  color: #fff;
}

.custom-add-comp-button {
    background-color: none;
    border-color: #2784E0;
    color: #2784E0;
}

</style>