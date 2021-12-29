import 'package:flutter/material.dart';

import '../data/data.dart';

class PlaylistHeader extends StatelessWidget {
  final Playlist playlist;

  const PlaylistHeader({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              playlist.imageURL,
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PLAYLIST',
                    style: Theme.of(context)
                        .textTheme
                        .overline!
                        .copyWith(fontSize: 12.0),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    playlist.name,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    playlist.description,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    'Created by ${playlist.creator} • ${playlist.songs.length} songs, ${playlist.duration}',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 20.0),
        _PlaylistButtons(followers: playlist.followers)
      ],
    );
  }
}

class _PlaylistButtons extends StatelessWidget {
  final String followers;

  const _PlaylistButtons({
    Key? key,
    required this.followers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding:
                const EdgeInsets.symmetric(horizontal: 48.0, vertical: 20.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            backgroundColor: Theme.of(context).accentColor,
            primary: Theme.of(context).iconTheme.color,
            textStyle: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(fontSize: 12.0, letterSpacing: 2.0),
          ),
          child: const Text('PLAY'),
        ),
        const SizedBox(
          width: 8.0,
        ),
        IconButton(
          icon: const Icon(Icons.favorite_border),
          onPressed: () {},
          iconSize: 30.0,
        ),
        IconButton(
          icon: const Icon(Icons.more_horiz),
          onPressed: () {},
          iconSize: 30.0,
        ),
        const Spacer(),
        Text(
          'Followers\n $followers',
          style: Theme.of(context).textTheme.overline!.copyWith(fontSize: 12.0),
          textAlign: TextAlign.right,
        )
      ],
    );
  }
}