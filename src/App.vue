<template>
  <div>
    <h2>Input type default = "tel"</h2>
    <div style="display: flex; flex-direction: row;">
      <v-otp-input
        ref="otpInput0"
        input-classes="otp-input"
        separator="-"
        :num-inputs="4"
        :should-auto-focus="true"
        @on-change="handleOnChange"
        @on-complete="handleOnComplete"
      />
      <button @click="handleClearInput('otpInput0')">Clear Input</button>
    </div>

    <h2>Input type = "number"</h2>
    <div style="display: flex; flex-direction: row;">
      <v-otp-input
        ref="otpInput1"
        input-classes="otp-input"
        separator="-"
        :num-inputs="4"
        :should-auto-focus="true"
        input-type="number"
        @on-change="handleOnChange"
        @on-complete="handleOnComplete"
      />
      <button @click="handleClearInput('otpInput1')">Clear Input</button>
    </div>

    <h2>Input type = "password"</h2>
    <div style="display: flex; flex-direction: row; margin-top: 40px;">
      <v-otp-input
        ref="otpInput2"
        input-classes="otp-input"
        separator="-"
        :num-inputs="4"
        :should-auto-focus="true"
        input-type="password"
        @on-change="handleOnChange"
        @on-complete="handleOnComplete"
      />
      <button @click="handleClearInput('otpInput2')">Clear Input</button>
    </div>
  </div>
</template>

<script>
import OtpInput from './components';

export default {
  name: 'App',
  components: {
    'v-otp-input': OtpInput,
  },
  methods: {
    handleOnComplete(value) {
      console.log('OTP completed: ', value);
    },
    handleOnChange(value) {
      console.log('OTP changed: ', value);
    },
    handleClearInput(ref) {
      this.$refs[ref].clearInput();
    },
  },
};
</script>

<style lang="less">
  .otp-input {
    width: 40px;
    height: 40px;
    padding: 5px;
    margin: 0 10px;
    font-size: 20px;
    border-radius: 4px;
    border: 1px solid rgba(0, 0, 0, 0.3);
    text-align: center;
    &.error {
      border: 1px solid red !important;
    }
  }
  .otp-input::-webkit-inner-spin-button,
  .otp-input::-webkit-outer-spin-button {
    -webkit-appearance: none;
    margin: 0;
  }
</style>
