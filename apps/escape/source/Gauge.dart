class Gauge extends Sprite
{
  static final String DIRECTION_UP = "DIRECTION_UP";
  static final String DIRECTION_RIGHT = "DIRECTION_RIGHT";
  static final String DIRECTION_DOWN = "DIRECTION_DOWN";
  static final String DIRECTION_LEFT = "DIRECTION_LEFT";

  String _direction;
  num _ratio;

  Bitmap _bitmap;

  Gauge(BitmapData bitmapData, [String direction = DIRECTION_LEFT])
  {
    _direction = direction;
    _ratio = 1.0;

    _bitmap = new Bitmap(bitmapData);
    _bitmap.clipRectangle = new Rectangle(0, 0, bitmapData.width, bitmapData.height);
    addChild(_bitmap);

    _updateMask();
  }

  //-----------------------------------------------------------------------

  _updateMask()
  {
    switch (_direction)
    {
      case DIRECTION_LEFT:
        _bitmap.clipRectangle.left = ((1.0 - _ratio) * width).toInt();
        _bitmap.clipRectangle.top = 0;
        _bitmap.clipRectangle.right = width;
        _bitmap.clipRectangle.bottom = height;
        break;

      case DIRECTION_UP:
        _bitmap.clipRectangle.left = 0;
        _bitmap.clipRectangle.top = ((1.0 - _ratio) * height).toInt();
        _bitmap.clipRectangle.right = width;
        _bitmap.clipRectangle.bottom = height;
        break;

      case DIRECTION_RIGHT:
        _bitmap.clipRectangle.left = 0;
        _bitmap.clipRectangle.top = 0;
        _bitmap.clipRectangle.right = (_ratio * width).toInt();
        _bitmap.clipRectangle.bottom = height;
        break;

      case DIRECTION_DOWN:
        _bitmap.clipRectangle.left = 0;
        _bitmap.clipRectangle.top = 0;
        _bitmap.clipRectangle.right = width;
        _bitmap.clipRectangle.bottom = (_ratio * height).toInt();
        break;

      default:
        throw "Invalid Gauge direction!";
    }
  }

  //-----------------------------------------------------------------------

  num get ratio() => _ratio;

  void set ratio(num value)
  {
    if (value < 0.0) value = 0.0;
    if (value > 1.0) value = 1.0;

    _ratio = value;
    _updateMask();
  }
}
