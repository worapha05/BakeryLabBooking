<script setup>
import { computed, ref, onMounted } from 'vue'
import AdminLayout from '@/Layouts/AdminLayout.vue'
import { useEquipmentStore } from '@/stores/equipment';

const equipmentStore = useEquipmentStore()


const equipment = ref('')

const searchEquipment = ref('')
const showAddEquipment = ref(false)

const filteredEquipment = computed(() => {
    return equipmentStore.list.filter(equipment => {
        if (searchEquipment.value) {
            return equipment.equipment_id.toString().includes(searchEquipment.value);
        }
        return true;
    })
})

// ฟังก์ชันเพื่อสลับสถานะของอุปกรณ์
const changeStatusEquipment = async (equipment) => {
    equipment.equipment_status = equipment.equipment_status === 'operational' ? 'broken' : 'operational';
    await equipmentStore.editStatus(equipment)
    await equipmentStore.loadEquipment()
}

const startAddingEquipment = () => {
    showAddEquipment.value = true;
}

const backToEquip = () => {
    showAddEquipment.value = false; // เปลี่ยนสถานะเมื่อกดปุ่ม
};

onMounted(async () => {
  await equipmentStore.loadEquipment()
  console.log(equipmentStore.list) 
})

const addEquipmentData = async () => {
    await equipmentStore.addEquipment(equipment.value)
    await equipmentStore.loadEquipment() // เปลี่ยนสถานะเมื่อกดปุ่ม
};

</script>

<template>
    <AdminLayout>
        <div class="flex justify-center">
            <div class="main-container w-[1000px] bg-white shadow-lg mt-14 relative p-4 rounded-lg border-2 border-gray-300">
                <div v-if="!showAddEquipment">
                    <div class="font-bold text-xl ml-5 mt-5">
                        เครื่องมือและอุปกรณ์
                        <div class="h-[0.5px] w-full rounded-lg border-2 bg-gray-300 my-3 mr-4"></div>
                    </div>
                    <div class="flex my-5">
                        <input v-model="searchEquipment" type="text" placeholder="Search by EquipmentID" class="input input-bordered w-80 ml-5" />
                        <button class="btn custom-add-equip-button absolute right-0 mr-10" @click="startAddingEquipment">
                            <img src="@/assets/icon-add-blue.png" alt="">
                            เพิ่มอุปกรณ์
                        </button>
                    </div>
                    <div class="ml-5">
                        <div class="h-[0.5px] w-full rounded-lg border-2 bg-gray-300 my-3 mr-4"></div>
                    </div>
                    <div class="overflow-x-auto">
                        <table class="table ml-5 mt-3">
                            <thead>
                            <tr class="bg-gray-200 rounded-lg border-2 border-gray-200">
                                <th class="">ID</th>
                                <th>Name</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr v-for="equipment in filteredEquipment" :key="equipment.equipment_id">
                                <td>{{ equipment.equipment_id }}</td>
                                <td>{{ equipment.equipment_name }}</td>
                                <td>{{ equipment.equipment_status }}</td>
                                <td>
                                    <button 
                                        class="btn btn-sm w-44"
                                        :class="equipment.equipment_status === 'operational' ? 'custom-broken-button' : 'custom-operational-button'"
                                        @click="changeStatusEquipment(equipment)">
                                        {{ equipment.equipment_status === 'operational' ? 'Change to broken' : 'Change to operational' }}
                                    </button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div v-else>
                    <div class="flex">
                        <div class="font-bold text-xl ml-10 mt-5">
                            เครื่องมือและอุปกรณ์
                            <div class="h-[0.5px] w-[900px] rounded-lg border-2 bg-gray-300 my-3 mt-6"></div>
                        </div>
                        <button class="btn absolute right-0 border-2 border-gray-300 mt-2 mr-10" @click="backToEquip">
                            <img src="@/assets/icon-back.png" alt="">
                            ย้อนกลับ
                        </button>
                    </div>
                    <div class="ml-12 my-5">
                        ชื่ออุปกรณ์
                    </div>
                    <input type="text" placeholder="" class="input input-bordered w-96 ml-12" v-model="equipment"/>
                    <div>
                        <button class="btn custom-change-btn w-36 ml-12 mt-12 mb-48" @click="addEquipmentData">
                            บันทึก
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </AdminLayout>
</template>

<style scoped>
.custom-operational-button {
    background-color: #2784E0;
    color: white;
}

.custom-broken-button {
    background-color: #CC1417; /* สีแดงเข้มสำหรับ operational */
    color: white;
}

.custom-add-equip-button {
    background-color: white;
    border-color: #2784E0;
    color: #2784E0;
}

.custom-change-btn {
  background-color: #15570F;
  color: #fff;
}

.custom-select {
    border: none;
    background-color: none;
    appearance: none;
    position: relative;
}
</style>
