<template>
    <div>
        <h2 class="text-center">Список SIM-карт</h2>
        <div class="row mb-2">
            <div class="offset-sm-7 col-sm-5">
                <select required class='form-control me-2'  v-model='tarif_id' @change='getSims()'>
                    <option value='0' selected>- Фильтр по тарифному плану -</option>
                    <option v-for='tarif in tarifs' :value='tarif.id'>{{ tarif.name }}</option>
                </select>
            </div>
        </div>

        <div class="row mb-3 fw-bold">
            <div class="col-lg-1 d-none d-md-block">ID</div>
            <div class="col-md-2 col-12">ФИО</div>
            <div class="col-md-2 col-6">IMEI</div>
            <div class="col-md-2 col-6">Телефон</div>
            <div class="col-md-2 col-6">Дата регистрации</div>
            <div class="col-md-2 col-6">Тарифный план</div>
            <div class="col-md-1 col-12">Действия</div>
        </div>

        <div  class="row mb-3" v-for="sim in sims" :key="sim.id">
            <hr>
            <div class="col-lg-1 d-none d-md-block fw-bold">{{ sim.id }}</div>
            <div class="col-md-2 col-12 fw-bold">{{ sim.fio }}</div>
            <div class="col-md-2 col-6">{{ sim.imei }}</div>
            <div class="col-md-2 col-6">{{ sim.phone }}</div>
            <div class="col-md-2 col-6">{{ sim.date_reg }}</div>
            <div class="col-md-2 col-6">{{ tarifName(sim.tarif_id) }}</div>
            <div class="col-md-1 col-12">
                <div role="group">
                    <router-link :to="{name: 'edit', params: { id: sim.id }}" class="btn btn-success m-1">Редактировать</router-link>
                    <button class="btn btn-danger m-1" @click="deleteSim(sim.id)">Удалить</button>
                </div>
            </div>
        </div>
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
