
<script setup>
import { computed, ref } from 'vue'
import { useUserStore } from '@/stores/user';
import ProfessorLayout from '@/Layouts/ProfessorLayout.vue'


const userStore = useUserStore()

const statuses = ['Profile', 'Chang password']
const selectedStatus = ref("Profile")

const changeSelectedStatus = ((newStatus) => {
    selectedStatus.value = newStatus
})

const first_name = ref(userStore.selectedUser.first_name)
const last_name = ref(userStore.selectedUser.last_name)
const phone_number = ref(userStore.selectedUser.phone_number)
const profile_image = ref(userStore.selectedUser.profile_image)
const position = ref(userStore.selectedUser.position)

const editData = async () => {
    const userData = {
    first_name: first_name,
    last_name: last_name,
    phone_number: phone_number,
    profile_image: profile_image
    }
    try {
        await userStore.editUser(userData);
    } catch (error) {
        console.log('error', error);
    }
};

</script>

<template>
    <ProfessorLayout>
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
                    <div class="avatar flex justify-center my-5 mt-10">
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
                            <input type="text" class="input input-bordered w-80" v-model="first_name"/>
                        </div>
                        <div class="mx-9">
                            <div class="my-5">
                                นามสกุล
                            </div>
                            <input type="text" class="input input-bordered w-80" v-model="last_name"/>
                        </div>
                    </div>
                    <div class="flex justify-center">
                        <div>
                            <div class="my-5">
                                ตำแหน่ง
                            </div>
                            <div class="bg-white rounded-lg border border-gray-300 w-80 h-12 my-1 pt-3 pl-4">
                                {{ userStore.selectedUser.position }}                               
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
                    <div class="flex justify-center mt-5 mb-10">
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
                            <input type="text" placeholder="Phone" class="input input-bordered w-80" v-model="phone_number"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="flex justify-center">
                <button class="btn custom-change-btn w-36 mt-9 mb-14" @click="editData">
                    save change
                </button>
            </div>
        </div>

        <!-- Chang password -->
        <div v-if="selectedStatus == 'Chang password'">
            <div class="flex justify-center">
                <div class="main-container w-[1000px] bg-white shadow-lg mx-10 relative my-0 p-4 rounded-lg border-2 border-gray-300">
                    <div class="font-bold text-base ml-10 mt-5">
                        เปลี่ยนรหัสผ่าน
                        <div class="h-[0.5px] w-[880px] rounded-lg border-2 bg-gray-300 my-3"></div>
                    </div>
                    <div class="flex justify-center custom-blue-f text-xl mt-14">
                        ตั้งค่ารหัสผ่านใหม่
                    </div>
                    <div class="flex justify-center text-gray-500 mt-5">
                        กรุณาระบุรหัสผ่านใหม่ที่ต้องการ
                    </div>
                    <div class="flex mt-14">
                        <div class="custom-blue-s ml-72">
                            รหัสผ่านเก่า
                        </div>
                        <div class="custom-red ml-2">
                            *
                        </div>
                    </div>
                    <div class="flex justify-center">
                        <input type="text" class="input input-bordered w-96 mt-5"/>
                    </div>
                    <div class="flex justify-center text-gray-500 mt-5">
                        รหัสผ่านของคุณต้องมีความยาวอย่างน้อย 8 ตัวอักษร
                    </div>
                    <div class="flex mt-10">
                        <div class="custom-blue-s ml-72">
                            รหัสผ่านใหม่
                        </div>
                        <div class="custom-red ml-2">
                            *
                        </div>
                    </div>
                    <div class="flex justify-center">
                        <input type="text" class="input input-bordered w-96 mt-5"/>
                    </div>
                    <div class="flex justify-center">
                        <button class="btn custom-change-btn w-36 mt-11 mb-14" @click="editData">
                            ยืนยัน
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </ProfessorLayout>
</template>

<style scoped>
.custom-button {
    background-color: #2784E1;
    color: white;
}

.custom-blue-f {
    color: #167FE9;
}

.custom-blue-s {
    color: #2784E0;
}

.custom-red {
    color: #CC1417;
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
