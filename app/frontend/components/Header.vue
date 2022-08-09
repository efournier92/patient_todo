<template>
    <header>{{ title }}</header>
    <div class="button-container">
        <Button @click="showAddTask" :iconClass="getIconClass()" diameter="50px" backgroundColor="white" textColor="green" />
    </div>
</template>

<script>
    import Button from './Button.vue'

    export default {
        title: 'Header',
        props: {
            title: String,
            shouldShowAddTask: Boolean,
        },
        components: {
            Button,
        },
        methods: {
            showAddTask() {
                this.$emit('show-add-task')
            },
            getIconClass() {
                return this.shouldShowAddTask
                    ? 'fa-solid fa-minus'
                    : 'fa-solid fa-plus'
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
        justify-content: center;
        margin-bottom: 20px;
        color: #00C853;
        font-size: 4em;
        font-weight: bold;
    }

    .button-container {
        display: flex;
        justify-content: end;
    }
</style>