<template>
    <div>
        <h2 class="text-center">Список SIM-карт</h2>
        <div class="row">
            <div class="col-sm-9">
            </div>
            <div class="col-sm-3">
                <select required class='form-control me-2'  v-model='tarif_id' @change='getSims()'>
                    <option value='0' selected>- Фильтр по тарифному плану -</option>
                    <option v-for='tarif in tarifs' :value='tarif.id'>{{ tarif.name }}</option>
                </select>
            </div>
        </div>

        <table class="table table-hover">
            <thead>
            <tr>
                <th>ID</th>
                <th>IMEI</th>
                <th>Телефон</th>
                <th>ФИО</th>
                <th>Дата регистрации</th>
                <th>Тарифный план</th>
                <th>Действия</th>
            </tr>
            </thead>
            <tbody>
            <tr v-for="sim in sims" :key="sim.id">
                <td>{{ sim.id }}</td>
                <td>{{ sim.imei }}</td>
                <td>{{ sim.phone }}</td>
                <td>{{ sim.fio }}</td>
                <td>{{ sim.date_reg }}</td>
                <td>{{ tarifName(sim.tarif_id) }}</td>
                <td>
                    <div role="group">
                        <router-link :to="{name: 'edit', params: { id: sim.id }}" class="btn btn-success m-1">Редактировать</router-link>
                        <button class="btn btn-danger m-1" @click="deleteSim(sim.id)">Удалить</button>
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
            tarif_id: 0,
            sims: [],
            tarifs: []
        }
    },
    created() {
        this.axios
            .get('/api/sims/')
            .then(response => {
                this.sims = response.data;
            });

        this.axios
            .get('/api/tarifs/')
            .then(response => {
                this.tarifs = response.data;
            });
    },
    methods: {
        getSims: function(){
            this.axios
                .get('/api/sims/',{
                    params: {
                        tarif_id: this.tarif_id
                    }
                })
                .then(response => {
                    this.sims = response.data;
                });
        },
        deleteSim(id) {
            this.axios
                .delete(`/api/sims/${id}`)
                .then(response => {
                    let i = this.sims.map(data => data.id).indexOf(id);
                    this.sims.splice(i, 1)
                });
        },
        tarifName(tarif_id) {
            var p = this.tarifs.map(data => data.id).indexOf(tarif_id);
            if (p >= 0) {
                return this.tarifs[p].name;
            } else {
                return "Не выбран";
            }
        }

    }
}
</script>
