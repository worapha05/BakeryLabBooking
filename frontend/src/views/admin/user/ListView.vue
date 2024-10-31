<script setup>
import { computed, ref, onMounted } from 'vue'
import AdminLayout from '@/Layouts/AdminLayout.vue'
import { useUserStore } from '@/stores/user';

const userStore = useUserStore()

const selectedUserType = ref('')
const searchEmail = ref('')

const filteredUsers = computed(() => {
    return userStore.list.filter(user => {
        const matchesType = selectedUserType.value === 'all' || selectedUserType.value === '' || selectedUserType.value === user.role
        const matchesEmail = searchEmail.value ? user.KU_email.includes(searchEmail.value) : true
        return matchesType && matchesEmail
    })
})

onMounted(async () => {
  await userStore.loadUser()
  console.log(userStore.list) 
})

// ฟังก์ชันเพื่อสลับสถานะ
const changeStatusUser = async (user) => {
    user.status = user.status === 'enabled' ? 'disabled' : 'enabled'
    await userStore.editStatus(user)
    await userStore.loadUser()
}

</script>

<template>
    <AdminLayout>
        <div class="flex justify-center">
            <div class="main-container w-[1000px] bg-white shadow-lg mt-14 relative p-4 rounded-lg border-2 border-gray-300">
                <div class="font-bold text-xl ml-5 mt-5">
                    Account management
                    <div class="h-[0.5px] w-full rounded-lg border-2 bg-gray-300 my-3 mr-4"></div>
                </div>
                <div class="flex">
                    <input v-model="searchEmail" type="text" placeholder="Search by KU_email" class="input input-bordered w-80 my-5 ml-5" />
                    <label class="input input-bordered flex items-center w-32 my-5 ml-5 relative">
                        <select v-model="selectedUserType" class="custom-select grow w-full"> 
                            <option value="" disabled selected>User type</option>
                            <option value="all">all</option>
                            <option value="admin">admin</option>
                            <option value="professor">professor</option>
                            <option value="student">student</option>
                        </select>
                        <span class="absolute right-3 top-1/2 transform -translate-y-1/2 pointer-events-none">▼</span>
                    </label>
                </div>
                <div class="overflow-x-auto">
                    <table class="table">
                        <thead>
                        <tr class="bg-gray-200 rounded-lg border-2 border-gray-200">
                            <th>Name</th>
                            <th>User type</th>
                            <th>Email</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr v-for="user in filteredUsers" :key="user.KU_email">
                            <td>{{ user.first_name }} {{ user.last_name }}</td>
                            <td>{{ user.role }}</td>
                            <td>{{ user.KU_email }}</td>
                            <td>{{ user.status }}</td>
                            <td>
                                <button 
                                    class="btn btn-sm ml-3 w-20"
                                    :class="user.status === 'enabled' ? 'custom-disable-button' : 'custom-fade-disable-button'"
                                    @click="changeStatusUser(user)">
                                    {{ user.status === 'enabled' ? 'Disable' : 'Enable' }}
                                </button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </AdminLayout>
</template>

<style scoped>
.custom-edit-button {
    background-color: #2784E0;
    color: white;
}

.custom-disable-button {
    background-color: #CC1417; /* สีแดงเข้มสำหรับ enabled */
    color: white;
}

.custom-fade-disable-button {
    background-color: #FFAFA3; /* สีแดงอ่อนสำหรับ disabled */
    color: white;
}

.custom-select {
    border: none;
    background-color: none;
    appearance: none;
    position: relative;
}
</style>
