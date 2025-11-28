import 'package:flutter/material.dart';

enum StatusProduto {
  ativo,
  pendente,
  cancelado,
}

extension StatusProdutoExtension on StatusProduto {
  String get nome {
    switch (this) {
      case StatusProduto.ativo:
        return 'Ativo';
      case StatusProduto.pendente:
        return 'Pendente';
      case StatusProduto.cancelado:
        return 'Cancelado';
    }
  }

  Color get cor {
    switch (this) {
      case StatusProduto.ativo:
        return Colors.green;
      case StatusProduto.pendente:
        return Colors.orange;
      case StatusProduto.cancelado:
        return Colors.red;
    }
  }

  IconData get icone {
    switch (this) {
      case StatusProduto.ativo:
        return Icons.check_circle;
      case StatusProduto.pendente:
        return Icons.pending;
      case StatusProduto.cancelado:
        return Icons.cancel;
    }
  }
}

enum TipoVeiculo {
  carro,
  moto,
  caminhao,
}

extension TipoVeiculoExtension on TipoVeiculo {
  String get nome {
    switch (this) {
      case TipoVeiculo.carro:
        return 'Carro';
      case TipoVeiculo.moto:
        return 'Moto';
      case TipoVeiculo.caminhao:
        return 'Caminhão';
    }
  }

  String get icone {
    switch (this) {
      case TipoVeiculo.carro:
        return '🚗';
      case TipoVeiculo.moto:
        return '🏍️';
      case TipoVeiculo.caminhao:
        return '🚚';
    }
  }
}

class ProdutoVeiculo {
  final String id;
  final String nome;
  final String placa;
  final TipoVeiculo tipo;
  final StatusProduto status;
  final String? imagemUrl;
  final DateTime dataCadastro;
  final String? descricao;

  ProdutoVeiculo({
    required this.id,
    required this.nome,
    required this.placa,
    required this.tipo,
    required this.status,
    this.imagemUrl,
    required this.dataCadastro,
    this.descricao,
  });
}

class MeusVeiculosPage extends StatefulWidget {
  @override
  _MeusVeiculosPageState createState() => _MeusVeiculosPageState();
}

class _MeusVeiculosPageState extends State<MeusVeiculosPage> {
  final TextEditingController _searchController = TextEditingController();
  List<ProdutoVeiculo> _veiculos = [];
  List<ProdutoVeiculo> _filteredVeiculos = [];

  // Filtros
  Set<TipoVeiculo> _filtrosTipo = {};
  Set<StatusProduto> _filtrosStatus = {};

  @override
  void initState() {
    super.initState();
    _carregarVeiculos();
    _searchController.addListener(_filtrarVeiculos);
  }

  void _carregarVeiculos() {
    // Dados de exemplo
    _veiculos = [
      ProdutoVeiculo(
        id: '1',
        nome: 'Honda Civic Touring',
        placa: 'ABC1D23',
        tipo: TipoVeiculo.carro,
        status: StatusProduto.ativo,
        imagemUrl:
            'https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?w=400&h=300&fit=crop',
        dataCadastro: DateTime.now().subtract(Duration(days: 5)),
        descricao: 'Carro familiar em perfeito estado',
      ),
      ProdutoVeiculo(
        id: '2',
        nome: 'Yamaha MT-07',
        placa: 'XYZ4E56',
        tipo: TipoVeiculo.moto,
        status: StatusProduto.pendente,
        imagemUrl:
            'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=400&h=300&fit=crop',
        dataCadastro: DateTime.now().subtract(Duration(days: 2)),
        descricao: 'Moto esportiva com baixa quilometragem',
      ),
      ProdutoVeiculo(
        id: '3',
        nome: 'Volvo FH 540',
        placa: 'CAM7B89',
        tipo: TipoVeiculo.caminhao,
        status: StatusProduto.ativo,
        imagemUrl:
            'https://images.unsplash.com/photo-1621252171976-2da8f3f4c461?w=400&h=300&fit=crop',
        dataCadastro: DateTime.now().subtract(Duration(days: 10)),
        descricao: 'Caminhão para carga pesada',
      ),
      ProdutoVeiculo(
        id: '4',
        nome: 'Fiat Argo Drive',
        placa: 'DEF0F12',
        tipo: TipoVeiculo.carro,
        status: StatusProduto.cancelado,
        imagemUrl:
            'https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?w=400&h=300&fit=crop',
        dataCadastro: DateTime.now().subtract(Duration(days: 15)),
        descricao: 'Veículo cancelado pelo usuário',
      ),
    ];
    _filtrarVeiculos();
  }

  void _filtrarVeiculos() {
    final query = _searchController.text.toLowerCase();

    setState(() {
      _filteredVeiculos = _veiculos.where((veiculo) {
        // Filtro por pesquisa
        final matchesSearch = query.isEmpty ||
            veiculo.nome.toLowerCase().contains(query) ||
            veiculo.placa.toLowerCase().contains(query);

        // Filtro por tipo de veículo
        final matchesTipo =
            _filtrosTipo.isEmpty || _filtrosTipo.contains(veiculo.tipo);

        // Filtro por status
        final matchesStatus =
            _filtrosStatus.isEmpty || _filtrosStatus.contains(veiculo.status);

        return matchesSearch && matchesTipo && matchesStatus;
      }).toList();
    });
  }

  void _mostrarFiltros(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => FiltrosVeiculosBottomSheet(
        filtrosTipo: _filtrosTipo,
        filtrosStatus: _filtrosStatus,
        onFiltrosChanged: (tipos, status) {
          setState(() {
            _filtrosTipo = tipos;
            _filtrosStatus = status;
          });
          _filtrarVeiculos();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meus Veículos',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
        elevation: 2,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list_rounded),
            onPressed: () => _mostrarFiltros(context),
            tooltip: 'Filtrar veículos',
          ),
          IconButton(
            icon: Icon(Icons.add_rounded),
            onPressed: () {
              // Navegar para tela de cadastro
            },
            tooltip: 'Cadastrar novo veículo',
          ),
        ],
      ),
      body: Column(
        children: [
          // Barra de pesquisa
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[50],
                border: Border.all(
                  color: Colors.grey[300]!,
                  width: 1.5,
                ),
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Buscar por nome ou placa...',
                  hintStyle: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 15,
                  ),
                  prefixIcon: Container(
                    padding: EdgeInsets.all(12),
                    child: Icon(
                      Icons.search_rounded,
                      color: Colors.blue[700],
                      size: 22,
                    ),
                  ),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: Icon(
                            Icons.clear_rounded,
                            color: Colors.grey[500],
                            size: 20,
                          ),
                          onPressed: () {
                            _searchController.clear();
                            _filtrarVeiculos();
                          },
                        )
                      : null,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 8,
                  ),
                ),
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w500,
                ),
                cursorColor: Colors.blue[700],
                onChanged: (value) {
                  _filtrarVeiculos();
                },
              ),
            ),
          ),

          // Contador de resultados
          if (_filteredVeiculos.isNotEmpty)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[50],
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey[200]!,
                    width: 1,
                  ),
                ),
              ),
              child: Text(
                '${_filteredVeiculos.length} ${_filteredVeiculos.length == 1 ? 'veículo encontrado' : 'veículos encontrados'}',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

          // Lista de veículos
          Expanded(
            child: _buildBody(),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (_filteredVeiculos.isEmpty) {
      final hasSearch = _searchController.text.isNotEmpty;
      final hasFilters = _filtrosTipo.isNotEmpty || _filtrosStatus.isNotEmpty;

      return Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (hasSearch || hasFilters) ...[
                Icon(
                  Icons.search_off_rounded,
                  size: 80,
                  color: Colors.grey[400],
                ),
                SizedBox(height: 20),
                Text(
                  hasSearch
                      ? 'Nenhum resultado para "${_searchController.text}"'
                      : 'Nenhum veículo encontrado',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  hasSearch
                      ? 'Tente ajustar os termos da busca ou limpar os filtros'
                      : 'Ajuste os filtros ou cadastre um novo veículo',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[500],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                if (hasSearch || hasFilters)
                  OutlinedButton.icon(
                    onPressed: () {
                      _searchController.clear();
                      setState(() {
                        _filtrosTipo.clear();
                        _filtrosStatus.clear();
                      });
                      _filtrarVeiculos();
                    },
                    icon: Icon(Icons.refresh_rounded, size: 18),
                    label: Text('Limpar busca e filtros'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.blue[700],
                      side: BorderSide(color: Colors.blue[700]!),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
              ] else ...[
                Icon(
                  Icons.directions_car_rounded,
                  size: 80,
                  color: Colors.grey[400],
                ),
                SizedBox(height: 20),
                Text(
                  'Nenhum veículo cadastrado',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Cadastre seu primeiro veículo para começar',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[500],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    // Navegar para tela de cadastro
                  },
                  icon: Icon(Icons.add_rounded),
                  label: Text('Cadastrar Veículo'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[700],
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 8),
      itemCount: _filteredVeiculos.length,
      itemBuilder: (context, index) {
        final veiculo = _filteredVeiculos[index];
        return _VeiculoListItem(veiculo: veiculo);
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

class _VeiculoListItem extends StatelessWidget {
  final ProdutoVeiculo veiculo;

  const _VeiculoListItem({required this.veiculo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: Colors.grey[200]!,
            width: 1.5,
          ),
        ),
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagem do veículo com badge de tipo
              _buildImagemComBadge(),
              SizedBox(width: 16),
              // Informações
              Expanded(
                child: _buildInformacoes(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImagemComBadge() {
    return Stack(
      children: [
        // Container da imagem
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[100],
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              veiculo.imagemUrl!,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                      color: Colors.blue[700],
                    ),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return _buildPlaceholderImagem();
              },
            ),
          ),
        ),
        // Badge do tipo de veículo
        Positioned(
          top: -6,
          right: -6,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: _getCorTipoVeiculo(),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(1, 1),
                ),
              ],
            ),
            child: Text(
              veiculo.tipo.icone,
              style: TextStyle(fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }

  Color _getCorTipoVeiculo() {
    switch (veiculo.tipo) {
      case TipoVeiculo.carro:
        return Colors.blue.shade600;
      case TipoVeiculo.moto:
        return Colors.orange.shade600;
      case TipoVeiculo.caminhao:
        return Colors.red.shade600;
    }
  }

  Widget _buildPlaceholderImagem() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.grey[200]!,
            Colors.grey[300]!,
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              veiculo.tipo.icone,
              style: TextStyle(fontSize: 28),
            ),
            SizedBox(height: 4),
            Text(
              veiculo.tipo.nome,
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey[600],
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInformacoes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Cabeçalho com nome do veículo
        Text(
          veiculo.nome,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.grey[900],
            height: 1.2,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 10),

        // Placa
        _buildPlaca(),
        SizedBox(height: 12),

        // Status e Tipo
        Row(
          children: [
            _buildStatus(),
            SizedBox(width: 8),
            _buildTipoVeiculo(),
          ],
        ),
        SizedBox(height: 10),

        // Data de cadastro
        _buildInfoRow(
          icon: Icons.calendar_today_rounded,
          text: 'Cadastrado em ${_formatarData(veiculo.dataCadastro)}',
        ),

        // Descrição (se houver)
        if (veiculo.descricao != null && veiculo.descricao!.isNotEmpty) ...[
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.description_rounded,
                    size: 16, color: Colors.grey[600]),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    veiculo.descricao!,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[700],
                      height: 1.4,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildPlaca() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue[100]!),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.confirmation_number_rounded,
              size: 16, color: Colors.blue[700]),
          SizedBox(width: 6),
          Text(
            veiculo.placa,
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue[800],
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatus() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: veiculo.status.cor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: veiculo.status.cor.withOpacity(0.3),
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            veiculo.status.icone,
            size: 14,
            color: veiculo.status.cor,
          ),
          SizedBox(width: 5),
          Text(
            veiculo.status.nome,
            style: TextStyle(
              fontSize: 12,
              color: veiculo.status.cor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTipoVeiculo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey[300]!,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.directions_car_rounded, size: 14, color: Colors.grey[600]),
          SizedBox(width: 6),
          Text(
            veiculo.tipo.nome,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[700],
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({required IconData icon, required String text}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.grey[200]!,
              width: 1,
            ),
          ),
          child: Icon(icon, size: 14, color: Colors.grey[600]),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
              height: 1.4,
              fontWeight: FontWeight.w500,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  String _formatarData(DateTime data) {
    return '${data.day.toString().padLeft(2, '0')}/${data.month.toString().padLeft(2, '0')}/${data.year}';
  }
}

class FiltrosVeiculosBottomSheet extends StatefulWidget {
  final Set<TipoVeiculo> filtrosTipo;
  final Set<StatusProduto> filtrosStatus;
  final Function(Set<TipoVeiculo>, Set<StatusProduto>) onFiltrosChanged;

  const FiltrosVeiculosBottomSheet({
    required this.filtrosTipo,
    required this.filtrosStatus,
    required this.onFiltrosChanged,
  });

  @override
  _FiltrosVeiculosBottomSheetState createState() =>
      _FiltrosVeiculosBottomSheetState();
}

class _FiltrosVeiculosBottomSheetState
    extends State<FiltrosVeiculosBottomSheet> {
  late Set<TipoVeiculo> _selectedTipos;
  late Set<StatusProduto> _selectedStatus;

  @override
  void initState() {
    super.initState();
    _selectedTipos = Set.from(widget.filtrosTipo);
    _selectedStatus = Set.from(widget.filtrosStatus);
  }

  void _aplicarFiltros() {
    widget.onFiltrosChanged(_selectedTipos, _selectedStatus);
    Navigator.of(context).pop();
  }

  void _limparFiltros() {
    setState(() {
      _selectedTipos.clear();
      _selectedStatus.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Filtrar Veículos',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.grey[900],
            ),
          ),
          SizedBox(height: 20),

          // Filtro por tipo de veículo
          Text(
            'Tipo de Veículo',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: TipoVeiculo.values.map((tipo) {
              final isSelected = _selectedTipos.contains(tipo);
              return FilterChip(
                label: Text(
                  '${tipo.icone} ${tipo.nome}',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                selected: isSelected,
                selectedColor: Colors.blue[100],
                checkmarkColor: Colors.blue[700],
                backgroundColor: Colors.grey[100],
                labelStyle: TextStyle(
                  color: isSelected ? Colors.blue[700] : Colors.grey[700],
                ),
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      _selectedTipos.add(tipo);
                    } else {
                      _selectedTipos.remove(tipo);
                    }
                  });
                },
              );
            }).toList(),
          ),
          SizedBox(height: 20),

          // Filtro por status
          Text(
            'Status',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: StatusProduto.values.map((status) {
              final isSelected = _selectedStatus.contains(status);
              return FilterChip(
                label: Text(
                  status.nome,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                selected: isSelected,
                selectedColor: status.cor.withOpacity(0.2),
                checkmarkColor: status.cor,
                backgroundColor: Colors.grey[100],
                labelStyle: TextStyle(
                  color: isSelected ? status.cor : Colors.grey[700],
                ),
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      _selectedStatus.add(status);
                    } else {
                      _selectedStatus.remove(status);
                    }
                  });
                },
              );
            }).toList(),
          ),

          SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: _limparFiltros,
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    side: BorderSide(color: Colors.grey[400]!),
                  ),
                  child: Text(
                    'Limpar Filtros',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: _aplicarFiltros,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[700],
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                  ),
                  child: Text(
                    'Aplicar Filtros',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom + 8),
        ],
      ),
    );
  }
}
