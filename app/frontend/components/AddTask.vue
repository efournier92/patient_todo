<template>
    <form class="add-task-form">
        <div class="form-control">
            <label>Task</label>
            <input v-model="description" type="description" name="description" placeholder="Add Task" />
        </div>
        <div class="form-control">
            <label>Day & Time</label>
            <input v-model="time" type="description" name="time" placeholder="Add Day & Time" />
        </div>
        <div class="form-control">
            <label>Set Reminders</label>
            <div class="form-checkbox-container">
                <input v-model="shouldRemind" class="form-checkbox" type="checkbox" name="shouldRemind" placeholder="Set Reminders" />
            </div>
        </div>
        <div class="button-container">
            <Button @click="saveTask" iconClass="fa-solid fa-floppy-disk" backgroundColor="green" textColor="white" diameter="60px" />
        </div>
        <!-- <button class="add-task-button" @click="saveTask">Add Task</button> -->
    </form>
</template>

<script>
    import Button from './Button.vue'

    export default {
        name: 'AddTask',
        components: {
            Button,
        },
        data() {
            return {
                description: '',
                time: '',
                shouldRemind: false,
            }
        },
        methods: {
            saveTask(e) {
                e.preventDefault()
                
                if (!this.description || !this.time) {
                    alert("Please fill out all form fields.")
                    return
                }

                const task = {
                    description: this.description,
                    time: this.time,
                    shouldRemind: this.shouldRemind,
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
    .add-task-form {
        margin: 1em;
        background-color: #F5F5F5;
        padding: 1em;
        border-radius: 2em;
        border-color: #B71C1C;
        border-width: 4px;
        border-style: solid;
    }

    .form-control {
        margin: 20px;
    }

    .form-control label {
        display: block;
        font-weight: bold;
        text-align: left;
    }

    .form-control input {
        width: 100%;
        height: 40px;
        margin-top: 5px;
        padding: 3px 7px;
        font-size: 17px;
    }

    .form-checkbox-container {
        width: 3em;
    }

    .form-checkbox {
        margin-left: 0;
    }

    .button-container {
        width: 100%;
        display: flex;
        justify-content: center;
    }
/* 
    .form-control-check {
        display: flex;
        align-items: start;
        justify-content: start;
    }

    .form-control-check label {
        flex: 1;
    }

    .form-control-check input {
        flex: 2;
        height: 20px;
    } */
</style>