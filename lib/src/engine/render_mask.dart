part of stagexl.engine;

abstract class RenderMask {

  bool get relativeToParent;

  bool get border;
  int get borderColor;
  int get borderWidth;

  void renderMask(RenderState renderState);
}