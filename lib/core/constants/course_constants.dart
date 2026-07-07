class CourseConstants {
  CourseConstants._();

  static const String title = 'Ready to delve into your first lesson?';
  static const String description =
      'Start your first lesson, read the description follow the web and youtube tutorials and test what you have learned with a quiz after each lesson. Good Luck!';
  static const String buttonText = 'Start Learning!';
  static const String lessonDescription = ''' Lesson Overview
Welcome to your very first deep dive into how computers actually work! Before you write a single line of code, it helps enormously to understand the physical "body" that all your future programs will run on. Think of this lesson as a tour of a computer's anatomy — every part has a job, and understanding those jobs will make concepts like "memory leaks," "slow performance," or "storage space" make intuitive sense later on, instead of feeling like abstract jargon.
By the end of this lesson, you'll be able to name the core hardware components inside any computer, explain what each one does in plain language, and understand how they work together every time you open an app, save a file, or run a program.
Main Content
1. The CPU — The Brain of the Computer
The Central Processing Unit (CPU) is often called the "brain" of the computer, and that's a pretty fair comparison. Every single instruction your code eventually boils down to — adding two numbers, comparing values, deciding which if branch to take — gets executed by the CPU.
The CPU works through what's called the fetch-decode-execute cycle:

Fetch: Grab the next instruction from memory.
Decode: Figure out what that instruction actually means.
Execute: Carry it out.

This cycle happens billions of times per second on a modern CPU (measured in GHz, or gigahertz — billions of cycles per second). That's why a "faster" CPU generally means your programs run more quickly: it can fetch, decode, and execute more instructions every second.
Beginner tip: Modern CPUs also have multiple "cores," which are like having several mini-brains working in parallel, letting your computer truly multitask instead of just switching between tasks really fast.
2. RAM — Short-Term Memory
Random Access Memory (RAM) is your computer's short-term, high-speed memory. When you open an app, the CPU loads the data and instructions it needs into RAM because reading from RAM is much faster than reading from a hard drive or SSD.
The key thing to remember: RAM is temporary. The moment you turn off your computer (or it loses power), everything in RAM disappears. This is why you've probably experienced losing unsaved work after a crash — if it wasn't saved to permanent storage, it only ever existed in RAM.
Why this matters for future coding lessons: When you later learn about variables in programming, you're really learning about how your program temporarily stores data in RAM while it runs.
3. Storage (SSD/HDD) — Long-Term Memory
Unlike RAM, storage devices like SSDs (Solid State Drives) and HDDs (Hard Disk Drives) keep your files safe permanently, even when the power is off. This is where your operating system, apps, photos, documents, and saved games actually live when you're not using them.

HDDs use spinning magnetic disks — they're cheaper but slower.
SSDs use flash memory chips (similar technology to USB drives, but much faster) — they're quicker but typically more expensive per gigabyte.

Beginner tip: A simple way to remember the difference between RAM and storage: RAM is your desk while you're working; storage is the filing cabinet where things live when you're done.
4. Input Devices — How You Talk to the Computer
Input devices are how you, the human, send information into the computer. The most familiar examples are the keyboard and mouse, but this category also includes touchscreens, microphones, webcams, and game controllers.
Every keystroke or click gets converted into electrical signals the CPU can process — this is the very first step in any interaction you have with software.
5. Output Devices — How the Computer Talks Back
Output devices take the computer's internal processing and turn it into something a human can actually perceive. The most common example is your monitor, which displays visual output, but this also includes speakers (audio output) and printers (physical, paper output).
Without output devices, all that fast CPU processing and RAM juggling would be invisible to us — output devices are what let us see the result of all that work.
6. The Motherboard — The Nervous System
The motherboard is the large circuit board that physically connects every other component together. It's easy to overlook because it doesn't "do" anything as dramatically as a CPU or as visibly as a monitor, but it's the communication backbone that lets the CPU talk to RAM, RAM talk to storage, and everything talk to your input/output devices.
Think of it as the nervous system of the computer — coordinating signals between all the "organs" we just covered.''';
}
