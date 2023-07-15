<template>
    <div>
        <h3 class="text-center">Добавить SIM-карту</h3>
        <div class="row">
            <div class="col-md-6">
                <form @submit.prevent="createSim">
                    <div class="form-group">
                        <label>IMEI</label>
                        <input maxlength="15" minlength="15" required type="text" class="form-control" v-model="sim.imei">
                    </div>
                    <div class="form-group">
                        <label>ФИО клиента</label>
                        <input required type="text" class="form-control" v-model="sim.fio">
                    </div>
                    <div class="form-group">
                        <label>Телефон без 7 и 8</label>
                        <input maxlength="10" minlength="10" required type="tel" class="form-control" v-model="sim.phone">
                    </div>
                    <div class="form-group">
                        <label>Дата регистрации</label>
                        <input required type="date" class="form-control" v-model="sim.date_reg">
                    </div>
                    <div class="form-group">
                        <label>Тариф</label>
                        <select required class='form-control' v-model='sim.tarif_id'>
                            <option value='0' selected>- Тариф -</option>
                            <option v-for='tarif in tarifs' :value='tarif.id'>{{ tarif.name }}</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary mt-3">Добавить</button>
                </form>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    data() {
        return {
            sim: {},
            tarifs: {}
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
        createSim() {
            this.axios
                .post('/api/sims', this.sim)
                .then(response => (
                    this.$router.push({ name: 'sims' })
                ))
                .catch(err => alert("Ошибка добавления SIM, проверьте уникальность данных!"))
                .finally(() => this.loading = false)
        }
    }
}
</script>
