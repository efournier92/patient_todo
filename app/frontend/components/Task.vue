<template>
    <div>
        <div
            @dblclick="onToggleReminder(task)"
            :class="['task', task.shouldRemind ? 'reminder' : '']"
        >   
            <p>
                Week #{{ task.week }}
                <div class="task-check-button">
                    <i @click="onDelete(task)" class="fas fa-check color-primary"></i>
                </div>
            </p>
            <h3>
                {{ task.description }}
            </h3>
        </div>
    </div>
</template>

<script>
export default {
    nam3: 'Task',
    props: {
        task: Object
    },
    methods: {
        onDelete(task) {
            this.$emit('delete-task', task)
        },
        onToggleReminder(task) {
            this.$emit('toggle-reminder', task)
        },
    },
    emits: [
        'delete-task',
        'toggle-reminder',
    ],
}
</script>

<style scoped>
.task {
    background: #f5f5f5;
    border-radius: 10px;
    margin: 1em;
    padding: 10px 20px;
    cursor: pointer;
}

.task.reminder {
    border-left: 14px solid #f06292;
}

.task h3 {
    display: flex;
    align-items: center;
    justify-content: space-between;
    text-align: start;
}

.task p {
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.task-check-button {
    text-align: end;
    font-size: 2em;
}
</style>