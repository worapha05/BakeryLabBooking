<script setup>
import NavbarLogin from '@/components/NavbarLogin.vue'
</script>

<template>
    <NavbarLogin/>
    <div class="flex items-center justify-center">
        <div class="custom-bg">
            <div class="mt-12 text-2xl font-bold">
                ตารางการจองห้องปฎิบัติการเบเกอรี่
            </div>
        </div>
    </div>
</template>

<style scoped>
.custom-bg {
    background-color: none;
    width: 1000px;
    overflow: auto;
}
</style>