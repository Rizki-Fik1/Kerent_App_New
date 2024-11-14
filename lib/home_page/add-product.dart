import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class AddProductWidget extends StatefulWidget {
  @override
  _AddProductWidgetState createState() => _AddProductWidgetState();
}

class _AddProductWidgetState extends State<AddProductWidget> {
  int _selectedDuration = 1;
  String _selectedPaymentMethod = 'Gopay';
  List<Widget> _imageWidgets = [];
  String? _selectedCondition;
  String? _selectedCategory;
  TextEditingController _priceController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  // Constants for maximum lengths
  static const int maxNameLength = 50;
  static const int maxDescriptionLength = 500;

  @override
  void dispose() {
    _priceController.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Add Produk',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImageSlideshow(),
              SizedBox(height: 20),
              _buildNameInput(),
              SizedBox(height: 10),
              _buildInputField('Stock', keyboardType: TextInputType.number),
              SizedBox(height: 10),
              _buildDropdown('Kondisi', ['New', 'Used'], _selectedCondition, (value) {
                setState(() => _selectedCondition = value);
              }),
              SizedBox(height: 10),
              _buildDropdown('Kategori', ['Laptop', 'Smartphone', 'Mouse', 'Keyboard'], _selectedCategory, (value) {
                setState(() => _selectedCategory = value);
              }),
              SizedBox(height: 10),
              _buildDurationAndPrice(),
              SizedBox(height: 20),
              _buildDescriptionInput(),
              SizedBox(height: 30),
              Text('Payment Method', style: TextStyle(color: Colors.white, fontSize: 16)),
              SizedBox(height: 10),
              _buildPaymentMethods(),
              SizedBox(height: 20),
              _buildAddButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageSlideshow() {
    return Container(
      height: 300,
      child: ImageSlideshow(
        width: double.infinity,
        height: 300,
        initialPage: 0,
        indicatorColor: Colors.blue,
        indicatorBackgroundColor: Colors.grey,
        children: _imageWidgets.isEmpty
            ? [_buildAddImagePlaceholder()]
            : [..._imageWidgets, _buildAddImagePlaceholder()],
      ),
    );
  }

  Widget _buildAddImagePlaceholder() {
    return Container(
      color: Colors.grey[800],
      child: IconButton(
        icon: Icon(Icons.add_photo_alternate, color: Colors.white, size: 50),
        onPressed: () {
          setState(() {
            _imageWidgets.add(Image.network(
              'https://via.placeholder.com/400x300',
              fit: BoxFit.cover,
            ));
          });
        },
      ),
    );
  }

  Widget _buildNameInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            controller: _nameController,
            style: TextStyle(color: Colors.white),
            inputFormatters: [
              LengthLimitingTextInputFormatter(maxNameLength),
            ],
            decoration: InputDecoration(
              hintText: 'Nama Produk',
              hintStyle: TextStyle(color: Colors.grey[400]),
              border: InputBorder.none,
            ),
            onChanged: (value) {
              setState(() {});
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              '${_nameController.text.length}/$maxNameLength',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(String hint, {TextInputType? keyboardType}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        style: TextStyle(color: Colors.white),
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey[400]),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items, String? value, void Function(String?) onChanged) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          onChanged: onChanged,
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: TextStyle(color: Colors.white)),
            );
          }).toList(),
          style: TextStyle(color: Colors.white),
          dropdownColor: Colors.grey[800],
          isExpanded: true,
          hint: Text(label, style: TextStyle(color: Colors.grey[400])),
        ),
      ),
    );
  }

  Widget _buildDurationAndPrice() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFF333333),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Durasi Sewa', style: TextStyle(color: Colors.grey[400], fontSize: 12)),
              SizedBox(height: 15,),
              GestureDetector(
                onTap: _showDurationPicker,
                child: Text(
                  '$_selectedDuration Hari',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Harga', style: TextStyle(color: Colors.grey[400], fontSize: 12)),
              SizedBox(
                width: 120,
                child: TextField(
                  controller: _priceController,
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefix: Text('Rp ', style: TextStyle(color: Colors.white)),
                    hintText: '0',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                  ),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showDurationPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 50,
                child: Center(
                  child: Text(
                    'Select Rental Duration',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: CupertinoPicker(
                  magnification: 1.22,
                  squeeze: 1.2,
                  useMagnifier: true,
                  itemExtent: 40.0,
                  backgroundColor: Colors.transparent,
                  scrollController: FixedExtentScrollController(
                    initialItem: _selectedDuration - 1,
                  ),
                  onSelectedItemChanged: (int selectedItem) {
                    setState(() {
                      _selectedDuration = selectedItem + 1;
                    });
                  },
                  children: List<Widget>.generate(30, (int index) {
                    return Center(
                      child: Text(
                        '${index + 1} ${index == 0 ? 'Hari' : 'Hari'}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ElevatedButton(
                  child: Text('Confirm'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    minimumSize: Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDescriptionInput() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            controller: _descriptionController,
            style: TextStyle(color: Colors.white),
            maxLines: 5,
            inputFormatters: [
              LengthLimitingTextInputFormatter(maxDescriptionLength),
            ],
            decoration: InputDecoration(
              hintText: 'Product Description',
              hintStyle: TextStyle(color: Colors.grey[400]),
              border: InputBorder.none,
            ),
            onChanged: (value) {
              setState(() {});
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              '${_descriptionController.text.length}/$maxDescriptionLength',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethods() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: ['Gopay', 'Dana', 'Cash',].map((method) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedPaymentMethod = method;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: _selectedPaymentMethod == method ? Colors.blue : Colors.grey[800],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              method,
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildAddButton() {
    return Container(
      margin: EdgeInsets.only(top: 8),
      width: double.infinity,
      child: ElevatedButton(
        child: Text(
          'Add Produk',
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          padding: EdgeInsets.symmetric(vertical: 16)
        ),
        onPressed: () {
          // Add product logic here
        },
      ),
    );
  }
}