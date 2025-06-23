# 🎧 Real-Time Noise Cancellation using LMS, NLMS, and RLS

This project was developed as part of the EE2800 – Digital Signal Processing course at IIT Hyderabad. The goal is to design an adaptive noise cancellation system using algorithms like **LMS**, **NLMS**, and **RLS**. The final solution is based on **RLS** for optimal performance.

## 📌 Problem Statement

Design a programmable, real-time noise cancellation system that processes two audio signals:
- `external_noise.txt` — the external noise signal \( w(n) \)
- `noisy_speech.txt` — clean speech \( s(n) \) mixed with leakage noise \( v(n) \)

The system must estimate the leakage noise \( \hat{v}(n) \) and subtract it from the received signal to improve audio quality, ideally achieving **full or partial suppression** of noise.

- In **full suppression**, all noise components are canceled while preserving the clean speech.
- In **partial suppression**, only non-tonal noises are canceled, preserving tonal components.

Performance is evaluated in terms of **SNR improvement** and convergence speed.

## 📂 Repository Structure

```

real-time-noise-cancellation/
├── lms/                   # LMS algorithm implementation
├── nlms/                  # NLMS algorithm implementation
├── rls/                   # RLS algorithm (final and best-performing)
├── clean\_data/            # Reference clean speech signals
├── noisy\_data/            # Noisy signals used for testing
├── plots/                 # Visual results: error, SNR, convergence
├── problems\_encountered.md # Issues faced and how we solved them
├── results/               # Output results, SNR logs, audio outputs
└── README.md              # Project overview (this file)

````

## ⚙️ Algorithms Implemented

- **LMS (Least Mean Squares):** Basic gradient descent adaptation
- **NLMS (Normalized LMS):** Scaled step-size based on input energy
- **RLS (Recursive Least Squares):** Fast convergence with memory of past errors

Final implementation is based on **RLS** due to its superior SNR improvement and faster adaptation.

## 🧪 Design Features

- Real-time simulation using buffered audio chunks
- Programmable tonal frequency rejection
- Selective cancellation modes (full / partial)
- No use of MATLAB built-in adaptive filtering functions (per project rules)
- All code written from scratch

## 🚀 How to Run

1. Clone the repository:
   ``` bash
   git clone https://github.com/yourusername/real-time-noise-cancellation.git
   cd real-time-noise-cancellation
   ```

2. Run any of the adaptive filter demos:

   ```bash
   matlab -r "run('rls/main.m')"
   ```

3. Visualize results using generated plots in the `plots/` folder.

> 💡 All input signals are sampled at 44.1 kHz and buffered for low-latency simulation.

## 📈 Performance Evaluation

| Algorithm | Avg. SNR Gain (dB) | Convergence Speed | Remarks             |
| --------- | ------------------ | ----------------- | ------------------- |
| LMS       | \~8–10 dB          | Slow              | Simple but stable   |
| NLMS      | \~10–12 dB         | Moderate          | Input-aware scaling |
| **RLS**   | **15+ dB**         | **Fast**          | Final choice        |

## 🧠 Challenges Faced

See [`problems_encountered.md`](./problems_encountered.md) for:

* Adaptive filter instability
* Buffer design for real-time simulation
* Tuning learning rate and forgetting factor

## 📚 References

* M. H. Hayes, *Statistical Digital Signal Processing and Modeling*, Wiley, 1996.
* P. S. R. Diniz, *Adaptive Filtering: Algorithms and Practical Implementation*, Springer, 2020.

## 📜 License

This project is intended for academic use under the IIT Hyderabad EE2800 course. For broader use or distribution, please contact the author.

---

```

Let me know if you want to add [plots and sample output links](f), [audio demos](f), or [usage instructions for each mode](f).
```
