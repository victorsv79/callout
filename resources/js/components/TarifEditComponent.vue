<template>
    <div>
        <h3 class="text-center">Редактировать тарифный план</h3>
        <div class="row">
            <div class="col-md-6">
                <form @submit.prevent="updateTarif">
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
                    <button type="submit" class="btn btn-primary mt-3">Обновить</button>
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
    created() {
        this.axios
            .get(`/api/tarifs/${this.$route.params.id}`)
            .then((res) => {
                this.tarif = res.data;
            });
    },
    methods: {
        updateTarif() {
            this.axios
                .patch(`/api/tarifs/${this.$route.params.id}`, this.tarif)
                .then((res) => {
                    this.$router.push({ name: 'tarifs' });
                });
        }
    }
}
</script>
