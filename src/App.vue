<template>
  <div>
    <vie-otp-input
      input-classes="otp-input"
      separator="-"
      :num-inputs="4"
      :should-auto-focus="true"
      :is-input-num="true"
      @on-complete="handleOnComplete"
    />
  </div>
</template>

<script>
import VieOtpInput from './components';

export default {
  name: 'App',
  components: {
    'vie-otp-input': VieOtpInput,
  },
  methods: {
    handleOnComplete(value) {
      console.log('OTP: ', value);
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
    textalign: "center";
    &.error {
      border: 1px solid red !important;
    }
  }
</style>
