class Scripts {
  static final List<String> initializationScript = [
    '''
    create table cliente (
      id integer primary key autoincrement,
      nome text not null,
      quantidadeCavalos integer not null,
      frequencia integer not null,
      localPadrao text not null,
      valorDivida real
    )
    ''',
    '''
    create table agendamento  (
      id integer primary key autoincrement,
      dataNumero numeric not null,
      quantidade integer not null,
      valor real not null,
      idCliente integer not null,
      CONSTRAINT fk_idCliente
        FOREIGN KEY (idCliente)
        REFERENCES cliente(id)
    );
    '''
  ];

  static final List<String> migrationScripts = [
    '''ALTER TABLE agendamento ADD COLUMN observacao Text;'''
  ];
}