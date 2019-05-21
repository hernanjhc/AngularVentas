import {Request, Response} from 'express';
import pool from '../database';

class DocumentosController {

    public index (req: Request, res: Response) {
        //res.send('Documentos') 
        pool.query('DESCRIBE tiposdocumento');
        res.json('tiposdocumentos');
    }
}

const documentosController = new DocumentosController();

export default documentosController;