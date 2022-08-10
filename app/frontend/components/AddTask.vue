<template>
    <form class="add-task-form">
        <div class="form-control">
            <label>Task</label>
            <input
                v-model="description"
                type="description"
                name="description"
                placeholder="Add Task"
            />
        </div>
        <div class="form-control">
            <label>Week</label>
            <input v-model="week" type="number" name="week" placeholder="Week Number" />
        </div>
        <div class="form-control">
            <label>Set Reminders</label>
            <div class="form-checkbox-container">
                <input
                    v-model="shouldRemind"
                    class="form-checkbox"
                    type="checkbox"
                    name="shouldRemind"
                    placeholder="Set Reminders"
                />
            </div>
        </div>
        <div class="button-container">
            <Button
                @click="saveTask"
                iconClass="fa-solid fa-floppy-disk"
                backgroundColor="#f06292"
                textColor="white"
                diameter="60px"
            />
        </div>
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
            week: '',
            shouldRemind: false,
        }
    },
    methods: {
        saveTask(e) {
            e.preventDefault()

            if (!this.description || !this.week) {
                alert("Please fill out all form fields.")
                return
            }

            const task = {
                description: this.description,
                week: this.week,
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
    background-color: #f5f5f5;
    padding: 1em;
    border-radius: 2em;
    border-color: #f06292;
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
</style>