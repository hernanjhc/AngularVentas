import { Router } from 'express';
import  documentosController  from '../controllers/documentosControllers';

class  DocumentosRoutes {

    public router: Router = Router();
    constructor() {
        this.config();
    }

    config(): void {
        //this.router.get('/', (req, res) => res.send('Documentos'));
        this.router.get('/', documentosController.index);
    }
}

const documentosRoutes = new DocumentosRoutes();
export default documentosRoutes.router;