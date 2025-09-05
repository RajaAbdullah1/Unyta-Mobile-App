import 'package:flutter/material.dart';

class HorizontalImageScroller extends StatefulWidget {
  const HorizontalImageScroller({
    super.key,
    required this.images,
    this.itemWidth = 180,
    this.itemHeight = 120,
    this.itemRadius = 16,
    this.gap = 12,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  });

  final List<String> images;
  final double itemWidth;
  final double itemHeight;
  final double itemRadius;
  final double gap;
  final EdgeInsets padding;

  @override
  State<HorizontalImageScroller> createState() =>
      _HorizontalImageScrollerState();
}

class _HorizontalImageScrollerState extends State<HorizontalImageScroller> {
  final ScrollController _controller = ScrollController();
  final ValueNotifier<bool> _canBack = ValueNotifier(false);
  final ValueNotifier<bool> _canForward = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _controller.addListener(_updateButtons);
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateButtons());
  }

  @override
  void dispose() {
    _controller.removeListener(_updateButtons);
    _controller.dispose();
    _canBack.dispose();
    _canForward.dispose();
    super.dispose();
  }

  void _updateButtons() {
    if (!_controller.hasClients || !_controller.position.hasContentDimensions) return;
    final pos = _controller.position;
    _canBack.value = pos.pixels > pos.minScrollExtent + 1;
    _canForward.value = pos.pixels < pos.maxScrollExtent - 1;
  }

  Future<void> _scrollBy({required bool forward}) async {
    if (!_controller.hasClients) return;
    final pos = _controller.position;
    final view = pos.viewportDimension;
    final delta = view * 0.8 * (forward ? 1 : -1);
    double target = pos.pixels + delta;
    target = target.clamp(pos.minScrollExtent, pos.maxScrollExtent);
    await _controller.animateTo(
      target,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive adjustments
    final itemWidth =
    screenWidth < 500 ? widget.itemWidth * 0.7 : widget.itemWidth;
    final itemHeight =
    screenWidth < 500 ? widget.itemHeight * 0.7 : widget.itemHeight;

    return SizedBox(
      height: itemHeight + 20, // ✅ Fixed height for visibility
      child: Stack(
        children: [
          ListView.separated(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            padding: widget.padding,
            physics: const BouncingScrollPhysics(),
            itemCount: widget.images.length,
            separatorBuilder: (_, __) => SizedBox(width: widget.gap),
            itemBuilder: (context, index) {
              final path = widget.images[index];
              final isNetwork = path.startsWith('http');
              return ClipRRect(
                borderRadius: BorderRadius.circular(widget.itemRadius),
                child: Image(
                  image: isNetwork
                      ? NetworkImage(path)
                      : AssetImage(path) as ImageProvider,
                  fit: BoxFit.cover,
                  width: itemWidth,
                  height: itemHeight,
                ),
              );
            },
          ),

          // Left Arrow
          ValueListenableBuilder<bool>(
            valueListenable: _canBack,
            builder: (context, showArrow, _) {
              return _EdgeControls(
                alignment: Alignment.centerLeft,
                showArrow: showArrow,
                onTap: () => _scrollBy(forward: false),
                height: itemHeight,
              );
            },
          ),

          // Right Arrow
          ValueListenableBuilder<bool>(
            valueListenable: _canForward,
            builder: (context, showArrow, _) {
              return _EdgeControls(
                alignment: Alignment.centerRight,
                showArrow: showArrow,
                onTap: () => _scrollBy(forward: true),
                rightSide: true,
                height: itemHeight,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _EdgeControls extends StatelessWidget {
  const _EdgeControls({
    required this.alignment,
    required this.showArrow,
    required this.onTap,
    required this.height,
    this.rightSide = false,
  });

  final Alignment alignment;
  final bool showArrow;
  final VoidCallback onTap;
  final bool rightSide;
  final double height;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !showArrow,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: showArrow ? 1.0 : 0.0,
        child: Align(
          alignment: alignment,
          child: Container(
            width: 60,
            height: height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: rightSide ? Alignment.centerRight : Alignment.centerLeft,
                end: rightSide ? Alignment.centerLeft : Alignment.centerRight,
                colors: [
                  Theme.of(context).colorScheme.surface.withOpacity(0.9),
                  Theme.of(context).colorScheme.surface.withOpacity(0.0),
                ],
              ),
            ),
            child: Center(
              child: Material(
                shape: const CircleBorder(),
                elevation: 3,
                color: Theme.of(context).colorScheme.primary,
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: onTap,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      rightSide
                          ? Icons.arrow_forward_ios_rounded
                          : Icons.arrow_back_ios_new_rounded,
                      color: Theme.of(context).colorScheme.surface,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
