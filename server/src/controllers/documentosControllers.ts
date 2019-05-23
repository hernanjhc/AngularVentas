import {Request, Response} from 'express';
import pool from '../database';

class DocumentosController {

    //public async getOne(req: Request, res: Response): Promise<void> {
    public async getOne(req: Request, res: Response): Promise<any> {
        //res.json({text: 'Este es el tipo de documento ' + req.params.id});
        const { id } = req.params;
        const doc = await pool.query('select * from tiposdocumento where id = ?', [id]);
        console.log(doc);   // leer resultado en terminal / RowDataPacket
        if (doc.length > 0) {
            return res.json(doc[0]);
        }
        //res.json({text: 'Tipo Documento encontrado'});
        res.status(404).json({text: 'Tipo Documento no existe'});
    }
    public async list (req: Request, res: Response)  {
        //res.send('Documentos') 
        //pool.query('DESCRIBE tiposdocumento');
        //res.json({text: 'Listando tipos de tiposdocumento'});
        const  td = await pool.query('select * from tiposdocumento');
        res.json(td);
    }

    public async create (req: Request, res: Response): Promise<void> {
        //console.log(req.body);  
        //await: se toma el tiempo, cuándo termina continúa con lo siguiente
        await pool.query('insert into tiposdocumento set ?', [req.body])    
        res.json({message: 'Tipo documento registrado'}); 
    }

    public async delete (req: Request, res: Response): Promise<void> {
        //res.json({text: 'Eliminando el tipo de Documento ' + req.params.id});
        const { id } = req.params;
        await pool.query('delete from tiposdocumento where id = ?', [id]);
        res.json({Message: ' Se elimino al tipo de Documento'});
    }

    public async update (req: Request, res: Response): Promise<void> {
        //res.json({text: 'Actualizando tipo de Documento ' + req.params.id});
        const { id } = req.params;
        console.log(req.body);  
        await pool.query('update tiposdocumento set ? where Id = ?', [req.body, id]);
        //await pool.query('update tiposdocumento set ? where Id = 2', [req.body]);
        res.json({Message: ' Se actualizó Tipo Documento'});
    }
}

const documentosController = new DocumentosController();

export default documentosController;