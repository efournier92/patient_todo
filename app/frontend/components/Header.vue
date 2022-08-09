<template>
    <header>
        <h1>{{ title }}</h1>
        <Button @click="showAddTask" color="green" />
    </header>
</template>

<script>
    import Button from './Button.vue'

    export default {
        title: 'Header',
        props: {
            title: String,
        },
        components: {
            Button,
        },
        methods: {
            showAddTask() {
                this.$emit('show-add-task')
            }
        },
        emits: [
            'add-task'
        ],
    }
</script>

<style scoped>
    header {
        display: flex;
        justify-content: space-between;
        margin-bottom: 20px;
    }
</style>