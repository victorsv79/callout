<template>

    <div class="container">
        <div class="text-center m-3">
            <div class="lead">CRUD система хранения данных SIM-карт (Laravel 8, Vue.js)</div>
        </div>
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
                <a class="navbar-brand" href="/">Главная</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Переключатель навигации">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item"><router-link to="/" class="nav-link">Список SIM-карт</router-link></li>
                        <li class="nav-item"><router-link to="/create" class="nav-link">Добавить SIM-карту</router-link></li>
                        <li class="nav-item"><router-link to="/tarifs" class="nav-link">Список тарифных планов</router-link></li>
                        <li class="nav-item"><router-link to="/tarifs/create" class="nav-link">Добавить тарифный план</router-link></li>
                    </ul>
                </div>
            </div>
        </nav>
        <router-view></router-view>
    </div>
</template>
<script>
export default {}
</script>
