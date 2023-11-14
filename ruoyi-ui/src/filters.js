// filters.js
export default {
  is(value) {
    if (!value) return '';
    value = value.toString();
    return value === 'Y' ? '是' : '否';
  }
};
