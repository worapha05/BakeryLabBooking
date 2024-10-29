<script setup>
import NavbarLogin from '@/components/NavbarLogin.vue'
import { useUserStore } from '../stores/user'
import { ref } from 'vue'
import { useRouter } from 'vue-router'

const userStore = useUserStore()
const router = useRouter()
const email = ref('')
const password = ref('')

const login = async () => {
  try {
    await userStore.login(email.value, password.value)
    if (userStore.isLogin) {
      console.log(userStore.selectedUser)
      if (userStore.selectedUser.role == "student") {
        router.push('/student/my-account')
      } else if (userStore.selectedUser.role == "professor") {
        router.push('/professor/my-account')
      } else {
        router.push('/admin/my-account')
      }
    } else {
      alert('Invalid email or password') // แสดงข้อความเตือน
    }
  } catch (error) {
    alert('Login failed: ' + error.message)
  }
}
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
            <input type="text" class="grow" placeholder="Email address" v-model="email"/>
          </label>
          <label class="input input-bordered flex items-center gap-2 mx-1 my-2">
            <input type="password" class="grow" placeholder="Password" v-model="password"/>
          </label>
          <div class="login-button">
            <button  @click="login()" class="btn w-full flex justify-center custom-login-btn mt-2">
                Login
            </button>
          </div>
          <div class="create-account-button">
            <RouterLink to="/register" class="btn flex justify-center btn-ghost custom-create-account-btn">
                Create account
            </RouterLink>
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