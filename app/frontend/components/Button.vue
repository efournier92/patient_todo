<template>
    <div class="round" :style="{ background: backgroundColor, color: textColor, width: diameter, height: diameter }">
        <div :class="[ iconClass ]"></div>
    </div>
</template>

<script>
    export default {
        name: 'Button',
        props: {
            iconClass: String,
            backgroundColor: String,
            textColor: String,
            diameter: String,
            shape: String,
        },
        methods: {
           
        },
        emits: [
            
        ]
    }
</script>

<style scoped>
    .round {
        /* width: 50px;
        height: 50px; */
        outline-style:initial;
        border-radius: 100px;
        cursor: pointer;
        font-size: 2em;
        display: flex;
        align-items: center;
        justify-content: center;
      }
</style>
