<template>
    <footer class="color-primary">
        <p>&copy; {{ getYear() }}</p>
    </footer>
</template>

<script>
export default {
    name: 'Footer',
    methods: {
        getYear() {
            const date = new Date()
            return date.getFullYear()
        }
    },
}
</script>

<style scoped>
footer {
    margin-top: 30px;
    text-align: center;
}
</style>