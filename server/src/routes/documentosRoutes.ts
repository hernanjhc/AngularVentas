import { Router } from 'express';
import  documentosController  from '../controllers/documentosControllers';

class  DocumentosRoutes {

    public router: Router = Router();

    constructor() {
        this.config();
    }

    config(): void {
        //this.router.get('/', (req, res) => res.send('Documentos'));
        this.router.get('/', documentosController.list);
        this.router.get('/:id', documentosController.getOne);
        this.router.post('/', documentosController.create);
        this.router.put('/:id', documentosController.update);
        this.router.delete('/:id', documentosController.delete);
    }
}

const documentosRoutes = new DocumentosRoutes();
export default documentosRoutes.router;