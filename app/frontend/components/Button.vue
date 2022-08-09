<template>
    <button class="btn" :style="{ background: color }">Add Task</button>
</template>

<script>
    export default {
        name: 'Button',
        props: {
            text: String,
            color: String,
            tasks: Array,
        },
        methods: {
           
        },
        emits: [
            
        ]
    }
</script>
