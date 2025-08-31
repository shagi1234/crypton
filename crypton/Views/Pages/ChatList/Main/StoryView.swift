//
//  StoryView.swift
//  crypton
//
//  Created by Meylis on 10.02.2025.
//

import SwiftUI

struct Story: Identifiable {
    let id = UUID()
    let image: String
    let duration: Double // Duration for each story
}

struct StoryView: View {
    let stories: [Story] = [
        Story(image: "story1", duration: 5),
        Story(image: "story2", duration: 5),
        Story(image: "story3", duration: 5)
    ]

    @State private var currentIndex = 0
    @State private var progress: CGFloat = 0.0
    @State private var timer: Timer?
    @State private var isPaused = false

    var body: some View {
        ZStack {
            // Display current story
            Image(stories[currentIndex].image)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .clipped()
                .onAppear {
                    startTimer()
                }

            VStack {
                // Progress Bar
                HStack(spacing: 4) {
                    ForEach(0..<stories.count, id: \.self) { index in
                        ProgressView(value: currentIndex == index ? progress : (currentIndex > index ? 1 : 0))
                            .progressViewStyle(LinearProgressViewStyle(tint: .white))
                            .frame(height: 3)
                            .frame(maxWidth: .infinity) // Ensure equal width
                    }
                }
                .padding(.top, 40)
                .padding(.horizontal)

                Spacer()

                // Tap & Hold Gesture to Pause
                HStack {
                    Color.clear
                        .contentShape(Rectangle())
                        .frame(width: UIScreen.main.bounds.width / 2)
                        .onTapGesture {
                            previousStory()
                        }

                    Color.clear
                        .contentShape(Rectangle())
                        .frame(width: UIScreen.main.bounds.width / 2)
                        .onTapGesture {
                            nextStory()
                        }
                }
                .frame(maxHeight: .infinity)
                .simultaneousGesture(
                    LongPressGesture(minimumDuration: 0.1)
                        .onChanged { _ in
                            pauseTimer()
                        }
                        .onEnded { _ in
                            resumeTimer()
                        }
                )
            }
        }
        .background(Color.black)
    }

    // Start the timer for auto-next story
    private func startTimer() {
        timer?.invalidate()
        progress = 0.0

        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            if !isPaused {
                withAnimation {
                    progress += 0.02
                    if progress >= 1.0 {
                        nextStory()
                    }
                }
            }
        }
    }

    // Pause progress when holding
    private func pauseTimer() {
        isPaused = true
    }

    // Resume progress after release
    private func resumeTimer() {
        isPaused = false
    }

    // Go to the next story
    private func nextStory() {
        if currentIndex < stories.count - 1 {
            currentIndex += 1
            startTimer()
        } else {
            timer?.invalidate()
        }
    }

    // Go to the previous story
    private func previousStory() {
        if currentIndex > 0 {
            currentIndex -= 1
            startTimer()
        }
    }
}

struct StoriesView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView()
    }
}

