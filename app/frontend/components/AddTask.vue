<template>
    <form class="add-form">
        <div class="form-control">
            <label>Task</label>
            <input v-model="text" type="text" name="text" placeholder="Add Task" />
        </div>
        <div class="form-control">
            <label>Day & Time</label>
            <input v-model="day" type="text" name="day" placeholder="Add Day & Time" />
        </div>
        <div class="form-control">
            <label>Set Reminders</label>
            <input v-model="reminder" type="checkbox" name="reminder" placeholder="Set Reminders" />
        </div>
        <button @click="saveTask">Add Task</button>
    </form>
</template>

<script>
    export default {
        name: 'AddTask',
        data() {
            return {
                text: '',
                day: '',
                reminder: false,
            }
        },
        methods: {
            saveTask(e) {
                e.preventDefault()
                
                if (!this.text || !this.day) {
                    alert("Please fill out all form fields.")
                    return
                }

                const task = {
                    // id: Math.floor(Math.random() * 10000),
                    text: this.text,
                    day: this.day,
                    reminder: this.reminder,
                }

                this.$emit('save-task', task)
            }
        },
        emits: [
            'save-task',
        ]
    }
</script>

<style scoped>
    .add-form {
        margin-bottom: 40px;
    }

    .form-control {
        margin: 20px;
    }

    .form-control label {
        display: block;
        font-weight: bold;
    }

    .form-control input {
        width: 100%;
        height: 40px;
        margin: 5pm;
        padding: 3px 7px;
        font-size: 17px;
    }

    .form-control-check {
        display: flex;
        align-items: center;
        justify-content: start;
    }

    .form-control-check label {
        flex: 1;
    }

    .form-control-check input {
        flex: 2;
        height: 20px;
    }
</style>