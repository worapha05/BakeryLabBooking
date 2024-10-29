import { ref, computed } from 'vue'
import { defineStore } from 'pinia'

export const eventStore = defineStore('booking', () => {
  const eventID = ref('')
  const eventDate = ref('')
  const eventTime = ref('')

  function createEvent(id,date, time) {
    eventID.value = id
    eventDate.value = date
    eventTime.value = time
  }

  return {eventID, eventDate, eventTime, createEvent}
})