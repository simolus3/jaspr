import 'package:jaspr/jaspr.dart';
import 'package:website/components/link_button.dart';
import 'package:website/constants/theme.dart';
import 'components/sponsors_list.dart';

class Community extends StatelessComponent {
  const Community({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield section(id: 'community', [
      span(classes: 'caption text-gradient', [text('Community')]),
      h2([text('Join the Community')]),
      div(classes: 'community-card', [
        div(classes: 'sponsor', [
          h4([text('Sponsor Jaspr')]),
          p([
            text(
                'Jaspr is free and open source. Sponsorships allow me to spend more time developing the framework and keep the project sustainable in the years to come. I\'m super thankful for all support.')
          ]),
          h5([text('Current Sponsors')]),
          SponsorsList(),
          div(classes: 'actions', [
            LinkButton.filled(
              icon: 'hand-heart',
              label: 'Become a Sponsor',
              to: 'https://github.com/sponsors/schultek',
            ),
          ]),
          p([
            em([
              text(
                  'Are you interested in a larger sponsoring including a prominent logo placement on this website? Contact me at '),
              a(href: 'mailto:kilian@schultek.dev', classes: 'animated-underline', [text('kilian@schultek.dev')]),
              text('.'),
            ]),
          ]),
        ]),
        div([
          h4([text('Discord')]),
          p([
            text(
                'Join our Discord community with over 400 developers. Chat with other developers, ask questions, and share your projects.')
          ]),
          div(classes: 'actions', [
            LinkButton.outlined(
              icon: 'custom-discord',
              label: 'Join Discord',
              to: 'https://discord.gg/XGXrGEk4c6',
            ),
          ]),
          h4([text('Enterprise Support')]),
          p([
            text(
                'Are you a startup or enterprise looking for paid support, consulting, or custom development? Don\'t hesitate to contact me.')
          ]),
          div(classes: 'actions', [
            LinkButton.outlined(
              icon: 'send',
              label: 'Get Support',
              to: 'mailto:kilian@schultek.dev',
            ),
          ]),
        ]),
      ]),
    ]);
  }

  @css
  static final List<StyleRule> styles = [
    css('#community', [
      css('&')
          .box(
            padding: EdgeInsets.only(
              top: sectionPadding,
              left: contentPadding,
              right: contentPadding,
              bottom: sectionPadding,
            ),
          )
          .flexbox(direction: FlexDirection.column, alignItems: AlignItems.center)
          .text(align: TextAlign.center),
      css('.community-card', [
        css('&')
            .box(
                maxWidth: maxContentWidth,
                margin: EdgeInsets.only(top: 3.rem),
                border: Border.all(BorderSide(color: borderColor, width: 2.px)),
                radius: BorderRadius.circular(12.px),
                shadow: BoxShadow(offsetX: 4.px, offsetY: 4.px, blur: 20.px, color: shadowColor1))
            .raw({'background': 'linear-gradient(180deg, ${background.value} 0%, ${surface.value} 100%)'})
            .flexbox(direction: FlexDirection.row, wrap: FlexWrap.wrap)
            .text(align: TextAlign.start),
        css('& > div').box(padding: EdgeInsets.all(2.rem)).flexItem(flex: Flex(grow: 1, basis: FlexBasis(20.rem))),
        css('& > div > h4:not(:first-child)').box(margin: EdgeInsets.only(top: 3.rem)),
        css('.sponsor', [
          css('&').box(
            border: Border.only(right: BorderSide(color: borderColor, width: 2.px)),
          ),
          css('h5').box(margin: EdgeInsets.only(bottom: 0.5.rem)),
          css('.actions').box(
              margin: EdgeInsets.only(
            top: 2.rem,
          )),
          css('p:last-child').box(margin: EdgeInsets.only(top: 2.rem)).combine(bodySmall),
        ]),
      ])
    ]),
  ];
}
