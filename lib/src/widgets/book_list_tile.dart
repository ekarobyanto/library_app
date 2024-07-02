import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookListTile extends StatelessWidget {
  final Function()? onPress;
  const BookListTile({super.key, this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: 120,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300]!,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'book-image',
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[200],
                ),
                child: CachedNetworkImage(
                  height: 80,
                  fit: BoxFit.cover,
                  imageUrl: 'https://via.placeholder.com/150',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Book Title asdasasas',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Author Name',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    maxLines: 2,
                    'Categories :\nHorror, Bid Gick, Thriller, Drama, Comedy, Action, Adventure, Sci-Fi, Fantasy, Mystery, Romance, Fiction, Non-Fiction, Biography, Autobiography, History, Science, Technology, Engineering, Mathematics, Art, Music, Health, Fitness, Self-Help, Cooking, Travel, Children, Young Adult, Religion, Spirituality, Philosophy, Business, Finance, Economics, Politics, Social Science, Education, Reference, Languages, Communication, Computers, Internet, Programming, Software, Hardware, Mobile, Web, Networking, Security, Databases, Games, Entertainment, Sports, Hobbies, Crafts, Home, Garden, Pets, Architecture, Design, Photography, Fashion, Beauty, Medical, Law, Parenting, Family, Relationships, Psychology, Sociology, Anthropology, Archaeology, Environment, Nature, Geography, Weather, Astronomy, Physics, Chemistry, Biology, Geology, Oceanography, Meteorology, Ecology, Agriculture, Forestry, Conservation, Zoology, Botany, Paleontology, Evolution, Genetics, Medicine, Nursing, Dentistry, Pharmacy, Veterinary, Health Care, Nutrition, Fitness, Wellness, Yoga, Meditation, Self-Help, Self-Improvement, Motivation, Inspiration, Success, Happiness, Mindfulness, Stress, Anxiety, Depression, Addiction, Recovery, Therapy, Counseling, Relationships, Parenting, Family, Marriage, Divorce, Dating, Love',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
