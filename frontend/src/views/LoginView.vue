<script setup>
import NavbarLogin from '@/components/NavbarLogin.vue'
</script>

<template>
    <NavbarLogin class="absolute top-0 w-full" />
    <div class="flex justify-center items-center min-h-screen">
      <div class="card card-compact bg-base-100 shadow-xl border border-gray-300 w-96" style="width: 500px; height: 500px;">
        <div class="flex justify-center">
        <figure>
          <img class="mt-8" src="@/assets/ku-login.png" alt="ku-login" />
        </figure>
        <div>
            <div class="mt-11 mx-5 custom-text">FACULTY OF AGRO-INDUSTRY</div>
            <div class="mx-5 text-xl">Bakery Lab Booking</div>
        </div>
        </div>
        <div class="card-body">
          <p class="text-center m-5">Please log-in before booking</p>
          <label class="input input-bordered flex items-center gap-2 mx-1 my-2">
            <input type="text" class="grow" placeholder="Email address" />
          </label>
          <label class="input input-bordered flex items-center gap-2 mx-1 my-2">
            <input type="text" class="grow" placeholder="Password" />
          </label>
          <div class="login-button">
            <a class="btn flex justify-center custom-login-btn mt-2">Login</a>
          </div>
          <div class="create-account-button">
            <a class="btn flex justify-center btn-ghost custom-create-account-btn">Create account</a>
          </div>
        </div>
      </div>
    </div>
</template>

<style scoped>
.custom-login-btn {
  background-color: #15570F;
  color: #fff;
}

.custom-create-account-btn {
  background-color: none;
  color: #167FE9;
}

.custom-text {
  background-color: none;
  color: #EA6AB7;
}
</style>