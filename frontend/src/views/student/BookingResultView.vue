<script setup>
import StudentLayout from '@/Layouts/StudentLayout.vue'
import BookingCard from '@/components/BookingCard.vue'
import { computed, ref, onMounted } from 'vue'
import { useBookingStore } from '@/stores/booking';
import { useUserStore } from '@/stores/user';

const userStore = useUserStore()

const bookingStore= useBookingStore()

const statuses = ['อนุมัติ', 'รออนุมัติ', 'ถูกยกเลิก']

const selectedStatus = ref("รออนุมัติ")
const filterBookingList = computed(() => {
    return bookingStore.list.filter(booking => booking.booking_status === selectedStatus.value)
})

const changeSelectedStatus = ((newStatus) => {
    selectedStatus.value = newStatus
})

onMounted(async () => {
  await bookingStore.loadBooking(userStore.selectedUser.student_id)
  console.log('Loaded Bookings:', bookingStore.list);
    console.log('Current Selected Status:', selectedStatus.value);
})


</script>
<template>
    <StudentLayout>
        <div class="my-6">
            <span class="text-3xl mx-12">ผลการขอจอง</span>
            <div class="my-6">
                <a
            v-for="status in statuses" :key="status"
            :class="status === selectedStatus ? 'btn custom-button ml-12' : 'btn button ml-12'"
          @click="changeSelectedStatus(status)">
          {{ status }}
        </a>
            </div>
            <div class="h-[0.5px] w-full bg-gray-300"></div>
        </div>

        <div v-if="filterBookingList.length > 0">
                        <div class="main-container w-auto bg-white shadow-lg mx-6 relative my-0 p-4">
                        <!-- Header Section  -->
                        <div class="flex">
                            <div class="avatar">
                                <div class="w-16 rounded-full mx-6 mb-6">
                                    <img src="@/assets/list.png" />
                                </div>
                            </div>
                            <span class="text-4xl mt-2">รายการ</span>
                        </div>
                        <BookingCard v-for="list in filterBookingList"
                        :bookingId= list.booking_id
                        :date= list.usage_date 
                        :time_start= list.usage_time_start
                        :time_end= list.usage_time_end
                        :usage= list.use_category
                        :status= list.booking_status
                        :lastAction= list.booking_datetime
                        icon= "@/assets/default-user.jpg"
                        ></BookingCard>
                
                    
                </div>
        </div>
        <div v-else>
            <img src="@/assets/no_data.png" alt="" class="mx-auto">
        </div>
    </StudentLayout>
</template>

<style scoped>
.custom-button {
    background-color: #2784E1;
    color: white;
}
</style>