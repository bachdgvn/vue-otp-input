# vue-otp-input

> A fully customizable, OTP(one-time password) input component built with Vue 2.x.

![Imgur](https://i.imgur.com/EaVHdtb.gif)

[Live Demo](https://zlx025mxpp.codesandbox.io/)

## Installation

To install the latest stable version:

```
npm install --save @bachdgvn/vue-otp-input
```

Basic usage:

```javascript
import VieOtpInput from "@bachdgvn/vue-otp-input";

Vue.component("vie-otp-input", VieOtpInput);
```

```javascript
<template>
  <div>
    <vie-otp-input
      inputClasses="otp-input"
      :numInputs="4"
       separator="-"
      :shouldAutoFocus="true"
      @on-complete="handleOnComplete"
    />
  </div>
</template>

<script>
export default {
  methods: {
    handleOnComplete(value) {
      console.log("OTP: ", value);
    }
  }
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
```

## Props

<table>
  <tr>
    <th>Name<br></th>
    <th>Type</th>
    <th>Required</th>
    <th>Default</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>num-inputs</td>
    <td>number</td>
    <td><strong>true</strong></td>
    <td>4</td>
    <td>Number of OTP inputs to be rendered.</td>
  </tr>
  <tr>
    <td>separator</td>
    <td>component<br></td>
    <td>false</td>
    <td></td>
    <td>Provide a custom separator between inputs by passing a component. For instance, <code>&lt;span&gt;-&lt;/span&gt;</code> would add <code>-</code> between each input</td>
  </tr>
  <tr>
    <td>input-classes</td>
    <td>className (string)</td>
    <td>false</td>
    <td>none</td>
    <td>Style applied or class passed to each input.</td>
  </tr>
  <tr>
    <td>should-auto-focus</td>
    <td>boolean</td>
    <td>false</td>
    <td>false</td>
    <td>Auto focuses input on inital page load.</td>
  </tr>
  <tr>
    <td>is-input-num</td>
    <td>boolean</td>
    <td>false</td>
    <td>false</td>
    <td>Restrict input to only numbers.</td>
  </tr>
</table>

## Events

<table>
  <tr>
    <th>Name<br></th>
    <th>Description</th>
  </tr>
  <tr>
    <td>on-complete</td>
    <td>Return OTP code typed in inputs.</td>
  </tr>
</table>
