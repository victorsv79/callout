<template>
    <div>
        <h3 class="text-center">Добавить тарифный план</h3>
        <div class="row">
            <div class="col-md-6">
                <form @submit.prevent="createTarif">
                    <div class="form-group">
                        <label>Название</label>
                        <input required type="text" class="form-control" v-model="tarif.name">
                    </div>
                    <div class="form-group">
                        <label>Минуты</label>
                        <input required type="number" class="form-control" v-model="tarif.minutes">
                    </div>
                    <div class="form-group">
                        <label>SMS</label>
                        <input required type="number" class="form-control" v-model="tarif.sms">
                    </div>
                    <div class="form-group">
                        <label>Стоимость</label>
                        <input required type="number" class="form-control" v-model="tarif.amount">
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
            tarif: {}
        }
    },
    methods: {
        createTarif() {
            this.axios
                .post('/api/tarifs', this.tarif)
                .then(response => (
                    this.$router.push({ name: 'tarifs' })
                ))
                .catch(err => console.log(err))
                .finally(() => this.loading = false)
        }
    }
}
</script>
