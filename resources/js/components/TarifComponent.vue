<template>
    <div>
        <h2 class="text-center">Список тарифных планов</h2>
        <table class="table table-hover">
            <thead>
            <tr>
                <th>ID</th>
                <th>Название</th>
                <th>Минуты</th>
                <th>SMS</th>
                <th>Стоимость</th>
                <th>Действия</th>
            </tr>
            </thead>
            <tbody>
            <tr v-for="tarif in tarifs" :key="tarif.id">
                <td>{{ tarif.id }}</td>
                <td>{{ tarif.name }}</td>
                <td>{{ tarif.minutes }}</td>
                <td>{{ tarif.sms }}</td>
                <td>{{ tarif.amount }}</td>
                <td>
                    <div role="group">
                        <router-link :to="{name: 'tarifs.edit', params: { id: tarif.id }}" class="btn btn-success m-1">Редактировать</router-link>
                        <button class="btn btn-danger m-1" @click="deleteTarif(tarif.id)">Удалить</button>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</template>
<script>
export default {
    data() {
        return {
            tarifs: []
        }
    },
    created() {
        this.axios
            .get('/api/tarifs/')
            .then(response => {
                this.tarifs = response.data;
            });
    },
    methods: {
        deleteTarif(id) {
            this.axios
                .delete(`/api/tarifs/${id}`)
                .then(response => {
                    let i = this.tarifs.map(data => data.id).indexOf(id);
                    this.tarifs.splice(i, 1)
                });
        },
    }
}
</script>
