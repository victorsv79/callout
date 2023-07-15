import SimComponent from './components/SimComponent.vue';
import SimCreateComponent from './components/SimCreateComponent.vue';
import SimEditComponent from './components/SimEditComponent.vue';

import TarifComponent from './components/TarifComponent.vue';
import TarifCreateComponent from './components/TarifCreateComponent.vue';
import TarifEditComponent from './components/TarifEditComponent.vue';

export const routes = [
    {
        name: 'sims',
        path: '/',
        component: SimComponent
    },
    {
        name: 'create',
        path: '/create',
        component: SimCreateComponent
    },
    {
        name: 'edit',
        path: '/edit/:id',
        component: SimEditComponent
    },

    {
        name: 'tarifs',
        path: '/tarifs',
        component: TarifComponent
    },
    {
        name: 'tarifs.create',
        path: '/tarifs/create',
        component: TarifCreateComponent
    },
    {
        name: 'tarifs.edit',
        path: '/tarifs/edit/:id',
        component: TarifEditComponent
    },

];
