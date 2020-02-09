<template>
  <div>
    <v-otp-input
      input-classes="otp-input"
      separator="-"
      :num-inputs="4"
      :should-auto-focus="true"
      :is-input-num="true"
      @on-change="handleOnChange"
      @on-complete="handleOnComplete"
    />
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
