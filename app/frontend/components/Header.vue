<template>
    <header class="color-primary">{{ title }}</header>
</template>

<script>
export default {
    title: 'Header',
    props: {
        title: String,
    }, 
}
</script>

<style scoped>
header {
    display: flex;
    justify-content: center;
    margin-botom: 20px;
    font-size: 3em;
    font-weight: bold;
}
</style>