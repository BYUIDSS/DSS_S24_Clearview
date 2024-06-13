import pandas as pd
class color:

    def __init__(self, cvcursor, cvconn):
        self.cvcursor = cvcursor
        self.cvconn = cvconn

    def insert_mirage_mesh(self, mirage_build_out, mesh_type):
        self.cvcursor.execute('''INSERT INTO 
                                mirage_mesh 
                                (mirage_id, mesh_id) 
                                VALUES 
                                (
                                    (SELECT mirage_id 
                                    FROM mirage 
                                    WHERE mirage_build_out = %s), 
                                    (SELECT mesh_id 
                                    FROM mesh 
                                    WHERE mesh_type = %s)
                                )''', 
                                (mirage_build_out, mesh_type))
        self.cvconn.commit()

    def select_mirage_mesh(self):
        self.cvcursor.execute('SELECT * FROM mirage_mesh')
        return self.cvcursor.fetchall()
    
    def display_mirage_mesh(self):
        df = pd.DataFrame(self.select_mirage_mesh())
        df.columns = ['Mirage Mesh Id', 'Mirage Id', 'Mesh Id']
        return df
    
    def update_mirage_mesh(self, mirage_mesh_id, mirage_build_out, mesh_type):
        self.cvcursor.execute('UPDATE mirage_mesh SET mirage_id = (SELECT mirage_id FROM mirage WHERE mirage_build_out = %s), mesh_id = (SELECT mesh_id FROM mesh WHERE mesh_type = %s) WHERE mirage_mesh_id = %s', (mirage_build_out, mesh_type, mirage_mesh_id))
        self.cvconn.commit()

    def delete_mirage_mesh(self, mirage_mesh_id):
        self.cvcursor.execute('DELETE FROM mirage_mesh WHERE mirage_mesh_id = %s', (mirage_mesh_id,))
        self.cvconn.commit()