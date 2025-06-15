<script setup lang="ts">
import { ref } from 'vue';

declare global {
  interface Window {
    pywebview: any;
  }
}

let inputValue = ref('');


const greet = () => {
  // This function will be called when the button is clicked
  // You can add your logic here to send a message to Python
  console.log("Button clicked! Sending message to Python...");
  console.log("Input value:", inputValue.value);
  // Example: You might want to use fetch or axios to send a request to your backend
  window.pywebview.api.send(`Hello, ${inputValue.value}`);
  window.pywebview.api.receive().then((response:any) => {
    console.log("Received response from Python:", response);
  });
};

</script>

<template>
  <div class="app">
    <h1>Welcome to My Vue App</h1>
    <p>This is a simple Vue.js application.</p>
    <div class="content">
      <input type="text" placeholder="Type something..." v-model="inputValue" />
      <button @click="greet()">greet</button>
    </div>
  </div>
</template>

<style scoped>

</style>
