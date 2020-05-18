<template>
  <div style="display: flex; align-items: center;">
    <input
      :class="inputClasses"
      ref="input"
      :type="isInputNum ? 'number' : 'text'"
      :min="isInputNum ? '0' : ''"
      :max="isInputNum ? '9' : ''"
      v-model="model"
      @input="handleOnChange"
      @keydown="handleOnKeyDown"
      @paste="handleOnPaste"
      @focus="handleOnFocus"
      @blur="handleOnBlur"
    />
    <span class="v-otp-separator" v-html="separator" />
  </div>
</template>

<script>
export default {
  name: 'SingleOtpInput',
  props: {
    value: {
      type: String,
    },
    separator: {
      type: String,
    },
    focus: {
      type: Boolean,
    },
    inputClasses: {
      type: String,
    },
    shouldAutoFocus: {
      type: Boolean,
    },
    isInputNum: {
      type: Boolean,
      default: false,
    },
  },
  data() {
    return {
      model: this.value || '',
    };
  },
  mounted() {
    if (this.$refs.input && this.focus && this.shouldAutoFocus) {
      this.$refs.input.focus();
    }
  },
  watch: {
    value(newValue, oldValue) {
      if (newValue !== oldValue) {
        this.model = newValue;
      }
    },
    // whenever question changes, this function will run
    focus(newFocusValue, oldFocusValue) {
      // Check if focusedInput changed
      // Prevent calling function if input already in focus
      if (oldFocusValue !== newFocusValue && this.$refs.input && this.focus) {
        this.$refs.input.focus();
        this.$refs.input.select();
      }
    },
  },
  methods: {
    handleOnChange() {
      if (this.model.length > 1) {
        this.model = this.model.slice(0, 1);
      }
      return this.$emit('change', this.model);
    },
    handleOnKeyDown(event) {
      // Only allow characters 0-9, DEL, Backspace and Pasting
      const keyEvent = (event) || window.event;
      const charCode = (keyEvent.which) ? keyEvent.which : keyEvent.keyCode;
      const allowedCharCodes = [8, 86, 46];
      if (!this.isInputNum) {
        this.$emit('keydown', event);
      } else if (this.isCodeNumeric(charCode) || allowedCharCodes.includes(charCode)) {
        this.$emit('keydown', event);
      } else {
        keyEvent.preventDefault();
      }
    },

    isCodeNumeric(charCode) {
      // numeric keys and numpad keys
      return (charCode >= 48 && charCode <= 57) || (charCode >= 96 && charCode <= 105);
    },
    handleOnPaste(event) {
      return this.$emit('paste', event);
    },
    handleOnFocus() {
      this.$refs.input.select();
      return this.$emit('focus');
    },
    handleOnBlur() {
      return this.$emit('blur');
    },
  },
};
</script>
