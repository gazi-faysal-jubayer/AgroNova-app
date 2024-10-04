import 'package:agro_nova_app/Crop%20Info/Insects/insect_text_box.dart';
import 'package:agro_nova_app/Home/NASA%20missions/mission_text_box.dart';
import 'package:flutter/material.dart';

import '../crop_card.dart';

class Insects extends StatelessWidget {
  const Insects({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 35),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'Aphids (Greenfly/Blackfly)',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              CropCard(
                imagePath: 'assets/image/bug1.jpg',
              ),
              MissionTextBox(
                title: 'Effect',
                content:
                    'Aphids suck the sap from plants, weakening them, reducing growth, and causing yellowing or curling of leaves. They also spread viral diseases in crops.',
              ),
              InsectTextBox(
                title: 'Identification Symptoms',
                content: [
                  'Clusters of small, soft-bodied insects (green, black, yellow, or red) on the undersides of leaves and stems.',
                  'Sticky residue (honeydew) on the leaves and stems, which may attract ants',
                  'Stunted growth and curled, yellowing leaves',
                ],
              ),
              InsectTextBox(
                title: 'Control Methods',
                content: [
                  'Biological: Introduce natural predators such as ladybugs, lacewings, or parasitic wasps.',
                  'Chemical: Use insecticidal soaps or neem oil as organic options, or specific insecticides if infestation is severe.',
                  'Cultural: Encourage a healthy ecosystem by planting companion plants like garlic or chives to repel aphids.',
                ],
              ),
              const SizedBox(height: 35),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'Cutworms',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              CropCard(
                imagePath: 'assets/image/bug2.jpg',
              ),
              MissionTextBox(
                title: 'Effect',
                content:
                    'Cutworms sever young plants at the base, leading to significant damage, particularly in seedlings. They feed on stems and roots during the night.',
              ),
              InsectTextBox(
                title: 'Identification Symptoms',
                content: [
                  'Wilting, cut, or dead seedlings.',
                  'Worms found curled around plant stems in the soil during the day.',
                ],
              ),
              InsectTextBox(
                title: 'Control Methods',
                content: [
                  'Biological: Introduce beneficial nematodes or predators like ground beetles to reduce the population.',
                  'Mechanical: Place collars around seedlings to protect them from cutworms.',
                  'Chemical: Use approved insecticides or baits around plant stems to kill cutworms.',
                  'Cultural: Rotate crops and remove plant debris to reduce places where cutworms can thrive.',
                ],
              ),
              const SizedBox(height: 35),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'Spider Mites',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              CropCard(
                imagePath: 'assets/image/bug3.jpg',
              ),
              MissionTextBox(
                title: 'Effect',
                content:
                    'Spider mites suck the sap from plant tissues, causing stippling, yellowing, and potentially the death of leaves. They can severely affect crop yields.',
              ),
              InsectTextBox(
                title: 'Identification Symptoms',
                content: [
                  'Fine webbing on plants, particularly on the undersides of leaves.',
                  'Tiny white, yellow, or red mites visible on leaves.',
                  'Leaves appear dusty, yellow, or bronzed, and may fall off prematurely.',
                ],
              ),
              InsectTextBox(
                title: 'Control Methods',
                content: [
                  'Biological: Introduce natural predators like predatory mites, ladybugs, or lacewings.',
                  'Chemical: Use insecticidal soaps, horticultural oils, or miticides to control infestations.',
                ],
              ),
              MissionTextBox(
                title: 'Cultural',
                content:
                    'Avoid water stress in plants, as mites thrive in dry conditions. Regularly wash plants with water to dislodge mites.',
              ),
              const SizedBox(height: 35),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'Armyworms',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              CropCard(
                imagePath: 'assets/image/bug5.jpg',
              ),
              MissionTextBox(
                title: 'Effect',
                content:
                    'Armyworms feed on a wide variety of crops, including grains and grasses. They can rapidly defoliate plants and cause severe yield losses.',
              ),
              InsectTextBox(
                title: 'Identification Symptoms',
                content: [
                  'Green or brown-striped caterpillars with dark heads.',
                  'Ragged, chewed leaves and stems.',
                  'Holes in leaves, skeletonized foliage, or plant defoliation.Presence of white butterflies hovering around crops.',
                ],
              ),
              InsectTextBox(
                title: 'Control Methods',
                content: [
                  'Biological: Introduce predators like parasitic wasps or use beneficial nematodes.',
                  'Chemical: Use insecticides like Spinosad or Bt (Bacillus thuringiensis) for organic control, or synthetic insecticides in severe cases.',
                  'Cultural: Regularly monitor crops for signs of infestation and use pheromone traps to track moth populations.',
                ],
              ),
              const SizedBox(height: 35),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'Whiteflies',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              CropCard(
                imagePath: 'assets/image/bug6.jpg',
              ),
              MissionTextBox(
                title: 'Effect',
                content:
                    'Whiteflies feed on plant sap, leading to stunted growth, yellowing, and leaf drop. They also produce honeydew, which promotes the growth of sooty mold on plants.',
              ),
              InsectTextBox(
                title: 'Identification Symptoms',
                content: [
                  'Tiny white insects flying from the undersides of leaves when disturbed.',
                  'Sticky honeydew on leaves, followed by black sooty mold.',
                  'Yellowing or wilting leaves.',
                ],
              ),
              InsectTextBox(
                title: 'Control Methods',
                content: [
                  'Biological: Release predators such as ladybugs, lacewings, or parasitic wasps.',
                  'Mechanical: Use yellow sticky traps to capture adult whiteflies.',
                  'Chemical: Apply insecticidal soap or neem oil as a non-toxic treatment.',
                  'Cultural: Remove heavily infested plants and prevent overcrowding to promote air circulation.',
                ],
              ),
              const SizedBox(height: 35),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'Thrips',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              CropCard(
                imagePath: 'assets/image/bug7.jpg',
              ),
              MissionTextBox(
                title: 'Effect',
                content:
                    'Thrips damage plants by puncturing the surface and sucking the contents of plant cells, causing silvery patches, streaks, or speckled areas on leaves. They can also spread plant viruses.',
              ),
              InsectTextBox(
                title: 'Identification Symptoms',
                content: [
                  'Tiny, slender insects (often yellow or black) visible on leaves and flowers.',
                  'Leaves have a silver or bronzed appearance with fine black fecal dots.',
                  'Distorted or stunted plant growth.',
                ],
              ),
              InsectTextBox(
                title: 'Control Methods',
                content: [
                  'Biological: Introduce natural enemies such as predatory mites or minute pirate bugs.',
                  'Chemical: Use insecticidal soaps, neem oil, or spinosad to control infestations.',
                  'Cultural: Remove affected plants, use reflective mulches to repel thrips, and ensure proper sanitation of crop debris.',
                ],
              ),
              const SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }
}
